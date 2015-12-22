package dk.sdu.dm847.exam.task2;

import weka.attributeSelection.*;
import weka.classifiers.trees.J48;
import weka.classifiers.trees.RandomForest;
import weka.core.Attribute;
import weka.core.Instances;
import weka.core.SerializationHelper;
import weka.core.converters.ArffLoader;
import weka.core.converters.Loader;
import weka.filters.Filter;
import weka.filters.supervised.attribute.AttributeSelection;

import java.io.File;

public class FeatureSelection {
    public static void main(String[] args) throws Exception {
        boolean useRandomForest = args[0].equals("rf");
        String fileName = "peakAlignedLabelled.arff";

        // Load our data
        ArffLoader trainLoader = new ArffLoader();
        trainLoader.setSource(new File(fileName));
        trainLoader.setRetrieval(Loader.BATCH);
        Instances data = trainLoader.getDataSet();
        Attribute trainAttribute = data.attribute(0);
        data.setClass(trainAttribute);
        data.deleteStringAttributes();

        ASEvaluation evaluator;


        AttributeSelection filter = new AttributeSelection();
        if (useRandomForest) {
            ClassifierSubsetEval eval = new ClassifierSubsetEval();
            RandomForest forest = new RandomForest();
            forest.setNumTrees(100);
            forest.setSeed(1234);
            eval.setClassifier(forest);
            evaluator = eval;
        } else {
            evaluator = new CfsSubsetEval();
        }

        GreedyStepwise search = new GreedyStepwise();
        search.setConservativeForwardSelection(true);
        search.setNumToSelect(5);
        search.setGenerateRanking(true);


        filter.setEvaluator(evaluator);
        filter.setSearch(search);
        filter.setInputFormat(data);

        // generate new data
        Instances newData = Filter.useFilter(data, filter);
        System.out.println(newData);

        RandomForest forest = new RandomForest();
        forest.setNumTrees(100);
        forest.setSeed(1234);
        forest.buildClassifier(data);
        SerializationHelper.write("halls_rf_trained.model", forest);
    }
}
