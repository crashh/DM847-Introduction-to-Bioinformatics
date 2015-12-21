package dk.sdu.dm847.exam.task2;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.logging.Logger;

import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.trees.RandomForest;
import weka.core.Attribute;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.SerializationHelper;
import weka.core.converters.ArffLoader;
import weka.core.converters.CSVLoader;
import weka.core.converters.CSVSaver;
import weka.core.converters.Loader;

/**
 * Step 4 of the program.
 * Tries to predict the unlabelled data, using the trained model. *
 */
public class Predict {

    private final Logger logger = Logger.getLogger(Predict.class.getName());
    private final String fileName;

    public Predict(String fileName) {
        this.fileName = fileName;
    }

    public void predict() throws Exception {
        /*
		 * First we load the test data from our ARFF file
		 */
        ArffLoader testLoader = new ArffLoader();
        testLoader.setSource(new File(fileName));
        testLoader.setRetrieval(Loader.BATCH);
        Instances testDataSet = testLoader.getDataSet();

		/*
		 * Now we tell the data set which attribute we want to classify, in our
		 * case, we want to classify the first column: survived
		 */
        Attribute testAttribute = testDataSet.attribute(0);
        testDataSet.setClass(testAttribute);
        testDataSet.deleteStringAttributes();

		/*
		 * Now we read in the serialized model from disk
		 */
        Classifier classifier = (Classifier) SerializationHelper
                .read("halls_rf_trained.model");

		/*
		 * This part may be a little confusing. We load up the test data again
		 * so we have a prediction data set to populate. As we iterate over the
		 * first data set we also iterate over the second data set. After an
		 * instance is classified, we set the value of the prediction data set
		 * to be the value of the classification
		 */
        ArffLoader test1Loader = new ArffLoader();
        test1Loader.setSource(new File(fileName));
        Instances test1DataSet = test1Loader.getDataSet();
        Attribute test1Attribute = test1DataSet.attribute(0);
        test1DataSet.setClass(test1Attribute);

		/*
		 * Now we iterate over the test data and classify each entry and set the
		 * value of the 'survived' column to the result of the classification
		 */
        Enumeration testInstances = testDataSet.enumerateInstances();
        Enumeration test1Instances = test1DataSet.enumerateInstances();
        while (testInstances.hasMoreElements()) {
            Instance instance = (Instance) testInstances.nextElement();
            Instance instance1 = (Instance) test1Instances.nextElement();
            double classification = classifier.classifyInstance(instance);
            instance1.setClassValue(classification);
        }

		/*
		 * Now we want to write out our predictions.
		 */
        CSVSaver predictedCsvSaver = new CSVSaver();
        predictedCsvSaver.setFile(new File("halls_prediction.csv"));
        predictedCsvSaver.setInstances(test1DataSet);
        predictedCsvSaver.writeBatch();

        logger.info("Prediciton saved to halls_prediction.csv");
    }
}
