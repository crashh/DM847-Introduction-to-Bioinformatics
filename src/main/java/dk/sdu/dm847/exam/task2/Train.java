package dk.sdu.dm847.exam.task2;

import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.trees.RandomForest;
import weka.core.Attribute;
import weka.core.Instances;
import weka.core.SerializationHelper;
import weka.core.converters.ArffLoader;
import weka.core.converters.Loader;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Logger;

/**
 * Step 3 of the program:
 * Loads the generated data from task 1 and trains a RF classifier using the WEKA framework.
 * source on HOW-to: https://github.com/birchsport/titanic
 *
 * Using the generated confusion matrix, mean accuracy, sensitivity and specificity are calculated.
 * Source: https://en.wikipedia.org/wiki/Confusion_matrix
 *
 * The five most descriminating features cannot be extracted in WEKA. Waiting on help from Jan.
 */
public class Train {

    private final Logger logger = Logger.getLogger(Train.class.getName());
    private final int NUM_FOLDS;
    private final String fileName;

    public Train(int numFolds, String fileName) {
        NUM_FOLDS = numFolds;
        this.fileName = fileName;
    }

    public void train() throws Exception {
        ArffLoader trainLoader = new ArffLoader();
        trainLoader.setSource(new File(fileName));
        trainLoader.setRetrieval(Loader.BATCH);
        Instances trainDataSet = trainLoader.getDataSet();

        Attribute trainAttribute = trainDataSet.attribute(0);
        trainDataSet.setClass(trainAttribute);

        Random random = new Random();
        Instances randomData = new Instances(trainDataSet);
        randomData.randomize(random);

        RandomForest classifier = new RandomForest();
        classifier.setNumTrees(300);
        classifier.setDebug(false);
        classifier.setSeed(1234);

        classifier.buildClassifier(trainDataSet);
        SerializationHelper.write("halls_rf_trained.model", classifier);
        logger.info("Saved trained model to halls_rf_trained.model");

        Evaluation evalAll = new Evaluation(randomData);
        List<double[][]> confusionMatrices = new ArrayList<>();

        for (int i = 0; i < NUM_FOLDS; i++) {
            Evaluation eval = new Evaluation(randomData);
            Instances train = randomData.trainCV(NUM_FOLDS, i);
            Instances test = randomData.testCV(NUM_FOLDS, i);
            Classifier copy = Classifier.makeCopy(classifier);
            copy.buildClassifier(train);
            eval.evaluateModel(copy, test);
            evalAll.evaluateModel(copy, test);
            confusionMatrices.add(eval.confusionMatrix());
            logger.info(eval.toMatrixString("=== Confusion matrix for fold " +
                    (i + 1) + "/" + NUM_FOLDS + " ===\n"));
        }

        double sensitivity = 0;
        double specificity = 0;
        double accuracy = 0;
        for (int i = 0; i < NUM_FOLDS; i++) {
            double[][] confusion = confusionMatrices.get(i);
            // Citrus = positive
            // Original = negative
            double trueCitrus = confusion[1][1];
            double trueHalls = confusion[0][0];
            double sum = confusion[0][0] + confusion[0][1] + confusion[1][0] + confusion[1][1];
            accuracy += (trueCitrus + trueHalls) / (sum);

            double citrusTotal = confusion[0][1] + confusion[1][1];
            if (citrusTotal != 0) {
                sensitivity += confusion[1][1] / citrusTotal;
            } else {
                sensitivity += 1;
            }

            double originalTotal = confusion[0][0] + confusion[1][0];
            if (originalTotal != 0) {
                specificity += confusion[0][0] / originalTotal;
            } else {
                specificity += 1;
            }
        }

        double meanSensitivity = sensitivity / NUM_FOLDS;
        double meanSpecificity = specificity / NUM_FOLDS;
        double meanAccuracy = accuracy / NUM_FOLDS;

        System.out.println(evalAll.toSummaryString("=== " + NUM_FOLDS + "-fold Cross-validation ===", true));
        System.out.println("Mean sensitivity: " + meanSensitivity);
        System.out.println("Mean specificity: " + meanSpecificity);
        System.out.println("Mean accuracy: " + meanAccuracy);
    }
}
