package dk.sdu.dm847.exam.task1;
import dk.sdu.dm847.exam.ToolUtils;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.logging.Logger;

public class PreprocessRawDataFiles {

    /**
     * Step 1 of the program:
     * Feeds files to the PEAX program, and plots the density plots.
     */

    private final Logger logger = Logger.getLogger(PreprocessRawDataFiles.class.getName());
    private File candyRawInput;
    private File outputFolder;

    public PreprocessRawDataFiles(String input, String output) {
        candyRawInput = new File(input);
        outputFolder = new File(candyRawInput, "output");
    }

    public void runPEAX(boolean plotDensity) {
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

                        if (plotDensity) {
                            logger.info("Running density plot script on " + file.getName());
                            ToolUtils.runRScript(false, "R-plot.r", candyRawInput.getAbsolutePath(), file.getName(),
                                    "output/" + file.getName().replace(".csv", "") + "_density_plot.png");
                        }

                        logger.info(file.getName() + " processing done!");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
            });
    }
}
