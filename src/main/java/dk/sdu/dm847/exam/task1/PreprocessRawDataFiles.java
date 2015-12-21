package dk.sdu.dm847.exam.task1;

import dk.sdu.dm847.exam.CsvParser;
import dk.sdu.dm847.exam.ToolUtils;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.logging.Logger;

public class PreprocessRawDataFiles {
    private static final Logger logger = Logger.getLogger(PreprocessRawDataFiles.class.getName());

    /**
     * Preprocceses input files by stripping out comments (header files starting with #).
     * Preprocesses filed are saved as temp_ before they are run using PEAX with an R script and finally saved
     * as final_ showing us the peaks.
     * The density plot is then generated using another R script and saved.
     */
    public static void main(String[] args) throws Exception {
        File candyRawInput = new File(args[0]);
        File outputFolder = new File(candyRawInput, "output");
        logger.info("Starting pre-process step.");
        logger.info("Input folder: " + candyRawInput.getAbsolutePath());
        logger.info("Output folder: " + outputFolder.getAbsolutePath());

        Arrays.asList(candyRawInput.listFiles()).stream()
                .filter(it -> it.getName().endsWith(".csv"))
                .forEach(file -> {
                    logger.info("Processing " + file.getName());
                    String processedOutput = new File(outputFolder, "final_" + file.getName()).getAbsolutePath();
                    try {
                        logger.info("Running peax on " + file.getName() + " -> " + processedOutput);
                        ToolUtils.runPEAX(file, new File(processedOutput));
                        logger.info("Running density plot script on " + file.getName());
                        //ToolUtils.runRScript(false, "R-plot.r", candyRawInput.getAbsolutePath(), file.getName(),
//                                "output/" + file.getName().replace(".csv", "") + "_density_plot.png");
                        logger.info(file.getName() + " processing done!");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                });
    }
}
