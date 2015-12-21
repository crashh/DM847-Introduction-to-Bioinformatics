package dk.sdu.dm847.exam.task1;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Main class for running the peak aligner.
 * Peaks for different samples are not always at the exactly same positions (but close). Thus we need to map
 * these peaks which are close with the same ID so we know they are measuring the same particles.
 *
 * Argument 1 should be directory of labelled files.
 * Argument 2 should be directory of unlabelled files.
 */
public class PeakAligner {
    public static void main(String[] args) {
        if (args.length != 2) {
            throw new IllegalArgumentException("Param 0: Labelledfiles dir. Param 1: Unlabelled files dir.");
        }
        List<File> labelledFiles = Arrays.stream(new File(args[0]).listFiles())
                .filter(it -> it.getName().endsWith(".csv"))
                .collect(Collectors.toList());

        List<File> unlabelledFiles = Arrays.stream(new File(args[1]).listFiles())
                .filter(it -> it.getName().endsWith(".csv"))
                .collect(Collectors.toList());


        PeakAlignment peakAlignment = new PeakAlignment(labelledFiles, unlabelledFiles, 0.5);
        peakAlignment.runAlignment();
    }
}
