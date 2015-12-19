package dk.sdu.dm847.exam;

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

public class PeakAlignment {
    private final List<File> peaxFile;
    private final double threshold;

    public PeakAlignment(List<File> peaxFile, double threshold) {
        this.peaxFile = peaxFile;
        this.threshold = threshold;
    }

    public void runAlignment() {
        List<List<List<String>>> allTables = peaxFile.stream().map(it -> {
            CsvParser parser = new CsvParser(it);
            parser.parseAndStripComments();
            return parser.getTable();
        }).collect(Collectors.toList());

        List<List<String>> table = new ArrayList<>();
        allTables.stream().forEach(t ->
                table.addAll(t.stream()
                    .filter(row -> !row.get(0).equals("measurement_name"))
                    .collect(Collectors.toList()))
        );

        List<Peak> peaks = table.parallelStream().map(it -> {
            String measurementName = it.get(0);
            String peakName = it.get(1);
            double t = Double.valueOf(it.get(2));
            int r = Integer.valueOf(it.get(3));
            double signal = Double.valueOf(it.get(4));
            int indexT = Integer.valueOf(it.get(5));
            int indexR = Integer.valueOf(it.get(6));
            return new Peak(measurementName, peakName, t, r, signal, indexT, indexR);
        }).collect(Collectors.toList());
        peaks.forEach(System.out::println);

        Map<String, Set<Peak>> whohas = new HashMap<>();
        List<Peak> alignedPeaks = new ArrayList<>();
        Set<Integer> skipList = new HashSet<>();
        for (int i = 0; i < peaks.size(); i++) {
            if (skipList.contains(i)) continue;

            Peak peakA = peaks.get(i);
            for (int j = i + 1; j < peaks.size(); j++) {
                Peak peakB = peaks.get(j);
                double distanceTo = peakA.distanceTo(peakB);
                if (distanceTo < threshold) {
                    System.out.printf("Found match between (%d, %f) and (%d, %f). Distance is = %f\n", peakA.getR(),
                            peakA.getT(), peakB.getR(), peakB.getT(), distanceTo);
                    addPeakToMap(whohas, peakB.getMeasurementName(), peakA);
                    skipList.add(j);
                }
            }
            addPeakToMap(whohas, peakA.getMeasurementName(), peakA);
            alignedPeaks.add(peakA);
            peakA.setUniqueId(alignedPeaks.size());
        }
        System.out.println("----");
        System.out.println("Aligned peaks:");
        alignedPeaks.forEach(System.out::println);
        System.out.printf("Before %d, After: %d\n", peaks.size(), alignedPeaks.size());
        whohas.forEach((key, value) -> {
            System.out.printf("Key '%s' owns: ", key);
            value.forEach(it -> System.out.printf("%d, ", it.getUniqueId()));
            System.out.println();
        });
    }

    private void addPeakToMap(Map<String, Set<Peak>> map, String owner, Peak peak) {
        Set<Peak> peaks = map.get(owner);
        if (peaks == null) {
            peaks = new HashSet<>();
        }
        peaks.add(peak);
        map.put(owner, peaks);
    }
}
