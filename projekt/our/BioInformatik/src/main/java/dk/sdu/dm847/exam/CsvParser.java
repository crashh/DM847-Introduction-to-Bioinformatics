package dk.sdu.dm847.exam;

import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class CsvParser {
    private final String inputFile;
    private List<List<String>> table;

    public CsvParser(String inputFile) {
        this.inputFile = inputFile;
    }

    public void parseStripComments() {
        try {
            List<String> strings = Files.readAllLines(Paths.get(new File(inputFile).toURI()));
            table = strings.stream()
                    .filter(it -> !it.startsWith("#"))
                    .map(it -> Arrays.asList(it.split(",")))
                    .collect(Collectors.toList());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<List<String>> getTable() {
        return Collections.unmodifiableList(table);
    }

    public void dumpTable(String output) {
        File file = new File(output);
        try (PrintWriter printWriter = new PrintWriter(new FileWriter(file))) {
            table.forEach(row -> {
                row.forEach(column -> printWriter.print(column + ","));
                printWriter.write("\n");
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
