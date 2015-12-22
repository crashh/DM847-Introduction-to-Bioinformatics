package dk.sdu.dm847.exam;

import dk.sdu.dm847.exam.task1.PeakAlignment;
import dk.sdu.dm847.exam.task1.PreprocessData;
import dk.sdu.dm847.exam.task2.Predict;
import dk.sdu.dm847.exam.task2.Train;

import java.io.File;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class RunMe {
    static String workDir = Paths.get("").toAbsolutePath().toString();

    static String labelledData = "./candy_labels/output";
    static String unlabelledData = "./candy_no_labels/output";

    public static void main(String[] args) {
        /*
         * Pre-process data by running it using PEAX.
         * This will give us all the peaks found in the raw data files.
         */
        PreprocessData preProcessTrain = new PreprocessData("candy_labels", "output");
        preProcessTrain.disableLogging();
        preProcessTrain.runPEAX(false);
        PreprocessData preProcessTest = new PreprocessData("candy_no_labels", "output");
        preProcessTest.disableLogging();
        preProcessTest.runPEAX(false);

        /*
         * Isolate peaks and give them a unique ID.
         * Peaks may not always be positioned exactly identical, thus all peaks within a specific
         * threshold should have the same unique ID.
         */
        List<File> labelledFiles = Arrays.stream(new File(labelledData).listFiles())
                .filter(it -> it.getName().endsWith(".csv"))
                .collect(Collectors.toList());

        List<File> unlabelledFiles = Arrays.stream(new File(unlabelledData).listFiles())
                .filter(it -> it.getName().endsWith(".csv"))
                .collect(Collectors.toList());
        // The 0.4 is the threshold for distance before a peak is considered separate:
        PeakAlignment peakAlignment = new PeakAlignment(labelledFiles, unlabelledFiles, 0.42);
        peakAlignment.disableLogging();
        peakAlignment.runAlignment();

        /*
         * Trains a Random Forest using labelled data such that it can predict what type of halls
         * is used, when used on non-labelled data.
         * Outputs file halls_rf.model
         */
        Train randomForestTrain = new Train(5, "peakAlignedLabelled.arff");
        try {
            randomForestTrain.train();
        } catch (Exception e) {
            e.printStackTrace();
        }

        /**
         * Predicts which halls is used on the unlabelled data set, using the trained model.
         * Outputs file halls_prediction.csv
         */
        Predict predictUnlabelledData = new Predict("peakAlignedUnlabelled.arff");
        try {
            predictUnlabelledData.predict();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
