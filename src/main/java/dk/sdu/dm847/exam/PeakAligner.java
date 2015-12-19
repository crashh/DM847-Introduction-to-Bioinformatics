package dk.sdu.dm847.exam;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class PeakAligner {
    public static void main(String[] args) {
        List<File> files = Arrays.stream(new File("candy_raw/output/").listFiles())
                .filter(it -> it.getName().endsWith(".csv"))
                .collect(Collectors.toList());

        PeakAlignment peakAlignment = new PeakAlignment(files, 0.5);
        peakAlignment.runAlignment();
    }
}
