package dk.sdu.dm847.exam.task1;

import dk.sdu.dm847.exam.CsvParser;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * The actual peak alignment happening, see PeakAligner.
 */
public class PeakAlignment {
    private final List<File> labelledPeaxFiles;
    private final List<File> unlabelldPeaxFiles;
    private final double threshold;

    public PeakAlignment(List<File> labelledPeaxFile, List<File> unlabelledPeaxFile, double threshold) {
        this.labelledPeaxFiles = labelledPeaxFile;
        this.unlabelldPeaxFiles = unlabelledPeaxFile;
        this.threshold = threshold;
    }

    // First identify labelled peaks.
    public void runAlignment() {
        List<List<String>> labelledTable = loadAndPreProcess(labelledPeaxFiles);
        List<List<String>> unlabelledTable = loadAndPreProcess(unlabelldPeaxFiles);

        List<Peak> labelledPeaks = createPeakObjects(labelledTable);
        List<Peak> unlabelledPeaks = createPeakObjects(unlabelledTable);
        List<Peak> allPeaks = new ArrayList<>();
        allPeaks.addAll(labelledPeaks);
        allPeaks.addAll(unlabelledPeaks);

        Map<String, Set<Peak>> whoHas = new HashMap<>();
        List<Peak> alignedPeaks = new ArrayList<>();

        Set<Integer> skipList = new HashSet<>();
        for (int i = 0; i < allPeaks.size(); i++) {
            if (skipList.contains(i)) continue;

            Peak peakA = allPeaks.get(i);
            List<Peak> peaks = new ArrayList<>();
            for (int j = i + 1; j < allPeaks.size(); j++) {
                Peak peakB = allPeaks.get(j);
                double distanceTo = peakA.distanceTo(peakB);
                if (distanceTo < threshold) {
                    System.out.printf("Found match between labelledPeak (%f, %f) and (%f, %f). Distance is = %f\n", peakA.getR(),
                            peakA.getT(), peakB.getR(), peakB.getT(), distanceTo);
                    addPeakToMap(whoHas, peakB.getMeasurementName(), peakA);
                    skipList.add(j);
                    peaks.add(peakB);
                }
            }
            addPeakToMap(whoHas, peakA.getMeasurementName(), peakA);
            alignedPeaks.add(peakA);
            peakA.setUniqueId(alignedPeaks.size());

            try (PrintWriter writer =  new PrintWriter(new FileWriter("peaks.csv"))) {
                writer.println("t r peak_id");
                alignedPeaks.forEach(it -> writer.printf("%f %f %d\n", it.getT(), it.getR(), it.getUniqueId()));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Map<String, Set<Peak>> whoHasLabels = new HashMap<>();
        Map<String, Set<Peak>> whoHasNoLabels = new HashMap<>();

        Set<String> labelledSources = labelledPeaks.stream()
                .map(Peak::getMeasurementName)
                .collect(Collectors.toSet());
        Set<String> unlabelledSources = unlabelledPeaks.stream()
                .map(Peak::getMeasurementName)
                .collect(Collectors.toSet());

        whoHas.forEach((key, peaks) -> {
            if (labelledSources.contains(key)) {
                whoHasLabels.put(key, peaks);
            } else if (unlabelledSources.contains(key)) {
                whoHasNoLabels.put(key, peaks);
            } else {
                throw new RuntimeException("???");
            }
        });

        writeResultsToFile(whoHasLabels, alignedPeaks, "training", true);
        writeResultsToFile(whoHasNoLabels, alignedPeaks, "test", false);
    }

    private void printDebugInformation(List<Peak> labelledPeaks, List<Peak> unlabelledPeaks, Map<String, Set<Peak>> whohasTraining, Map<String, Set<Peak>> whohasTest, List<Peak> alignedPeaksTraining) {
        System.out.println("----");
        System.out.println("Aligned peaks:");
        alignedPeaksTraining.forEach(System.out::println);
        System.out.printf("Before %d, After: %d\n", labelledPeaks.size() + unlabelledPeaks.size(), alignedPeaksTraining.size());
        whohasTraining.forEach((key, value) -> {
            System.out.printf("Key '%s' owns: ", key);
            value.forEach(it -> System.out.printf("%d, ", it.getUniqueId()));
            System.out.println();
        });
        whohasTest.forEach((key, value) -> {
            System.out.printf("Key '%s' owns: ", key);
            value.forEach(it -> System.out.printf("%d, ", it.getUniqueId()));
            System.out.println();
        });
    }


    private List<List<String>> loadAndPreProcess(List<File> peaxFile) {
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
        return table;
    }

    private List<Peak> createPeakObjects(List<List<String>> table) {
        List<Peak> peaks = table.parallelStream().map(it -> {
            String measurementName = it.get(0);
            String peakName = it.get(1);
            double t = Double.valueOf(it.get(2));
            double r = Double.valueOf(it.get(3));
            double signal = Double.valueOf(it.get(4));
            int indexT = Integer.valueOf(it.get(5));
            int indexR = Integer.valueOf(it.get(6));
            return new Peak(measurementName, peakName, t, r, signal, indexT, indexR);
        }).collect(Collectors.toList());
        peaks.forEach(System.out::println);
        return peaks;
    }

    private void writeResultsToFile(Map<String, Set<Peak>> whoHas, List<Peak> alignedPeaks, String filename,
                                    boolean hasLabels) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filename + ".arff"))) {
            Map<String, Label> labelsMap = new HashMap<>();
            if (hasLabels) {
                Label.readLabels(new File("candy_labels/labels.csv")).forEach(it -> labelsMap.put(it.getOrigin(), it));
            }

            writeArffHeader(alignedPeaks, writer, hasLabels);
            whoHas.forEach((key, value) -> {
                boolean[] hasPeaks = new boolean[alignedPeaks.size()];
                value.forEach(it -> hasPeaks[it.getUniqueId() - 1] = true);
                if (hasLabels) {
                    Label label = labelsMap.get(key.replace("temp_", "").replace(".csv", ""));
                    writer.printf(label.getType().name().charAt(0) + ",");
                } else {
                    writer.print("?,");
                }

                boolean first = true;
                for (boolean hasPeak : hasPeaks) {
                    if (!first) writer.printf(",");
                    first = false;
                    writer.printf("%d", hasPeak ? 1 : 0);
                }
                writer.println();
            });
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        //List<List<Peak>> p = Collections.singletonList(alignedPeaks);
        //PeakAlignmentPlot peakAlignmentPlot = new PeakAlignmentPlot(p);
        //peakAlignmentPlot.setVisible(true);
    }

    private void writeArffHeader(List<Peak> alignedPeaks, PrintWriter writer, boolean hasLabel) {
        writer.println("@relation training");
        writer.println();
        writer.println("@attribute t {H,C}");
        for (int i = 0; i < alignedPeaks.size(); i++) {
            writer.printf("@attribute p%d {0,1}\n", i + 1);
        }
        writer.println();
        writer.println("@data");
        writer.println();
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
