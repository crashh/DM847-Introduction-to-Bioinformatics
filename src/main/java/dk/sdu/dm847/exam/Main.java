package dk.sdu.dm847.exam;

import java.io.File;

public class Main {
    public static void main(String[] args) throws Exception {
        CsvParser parser = new CsvParser("example1.csv");
        parser.parseStripComments();
        parser.dumpTable("test_output.csv");
        ToolUtils.runPEAX(new File("test_output.csv"), new File("output.csv"));
        ToolUtils.runRScript(false, "R-plot.r", new File(".").getAbsolutePath(), "example1.csv", "density_plot.png");
    }
}
