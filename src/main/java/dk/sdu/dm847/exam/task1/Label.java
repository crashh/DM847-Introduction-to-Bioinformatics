package dk.sdu.dm847.exam.task1;

import dk.sdu.dm847.exam.CsvParser;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Used to see which labels belongs to which files.
 */
public class Label {
    private final CandyType type;
    private final String origin;

    public Label(CandyType type, String origin) {
        this.type = type;
        this.origin = origin;
    }

    public CandyType getType() {
        return type;
    }

    public String getOrigin() {
        return origin;
    }

    @Override
    public String toString() {
        return "Label{" +
                "type=" + type +
                ", origin='" + origin + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Label labels = (Label) o;

        if (type != labels.type) return false;
        return origin.equals(labels.origin);

    }

    @Override
    public int hashCode() {
        int result = type.hashCode();
        result = 31 * result + origin.hashCode();
        return result;
    }

    public static List<Label> readLabels(File inputFile) {
        CsvParser csvParser = new CsvParser(inputFile);
        csvParser.parseAndStripComments();
        return csvParser.getTable().stream()
                .skip(1)
                .map(it -> {
                    CandyType type = CandyType.fromString(it.get(1));
                    String origin = it.get(2);
                    return new Label(type, origin);
                })
                .collect(Collectors.toList());
    }

    public enum CandyType {
        HALLS,
        CITRUS;

        public static CandyType fromString(String string) {
            return Arrays.stream(values())
                    .filter(it -> it.name().equalsIgnoreCase(string)).findAny()
                    .orElseThrow(() -> new RuntimeException("Invalid candy type: " + string));
        }
    }

}
