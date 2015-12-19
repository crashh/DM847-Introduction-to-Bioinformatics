package dk.sdu.dm847.exam;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class ToolUtils {
    private static final String PEAX_PATH = "./peax/";

    public static void readProcess(Process p) throws IOException {
        BufferedReader pStdout = new BufferedReader(new InputStreamReader(p.getErrorStream()));
        BufferedReader pStderr = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String line;
        while ((line = pStdout.readLine()) != null) {
            System.out.println(line);
        }
        while ((line = pStderr.readLine()) != null) {
            System.out.println(line);
        }
    }

    public static void runPEAX(File input, File output) throws IOException {
        Process peaxP = Runtime.getRuntime().exec("./peax " + input.getAbsolutePath() + " " + output.getAbsolutePath(),
                new String[0], new File(PEAX_PATH));
        readProcess(peaxP);
    }

    public static void runRScript(boolean silence, String scriptFileName, String... args) throws IOException {
        Process rProcess = Runtime.getRuntime().exec("Rscript " + scriptFileName + " " + String.join(" ", args));
        if (!silence) {
            readProcess(rProcess);
        }
    }

}
