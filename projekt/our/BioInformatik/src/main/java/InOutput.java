import java.io.*;


/**
 * Created by anders on 12/7/15.
 */
public class InOutput {

    private static String PEAX_PATH = "peax/peax";

    private BufferedReader fileInput;
    private PrintWriter fileOutput;

    public InOutput(String fileInName, String fileOutName) throws IOException {
        this.fileInput = new BufferedReader(new FileReader(fileInName));
        this.fileOutput = new PrintWriter(new FileWriter(fileOutName));
    }

    public void prepareMatrix() throws IOException {
        for(String line = fileInput.readLine(); line != null; line = fileInput.readLine()) {
            if ( line.startsWith("#") || line.startsWith("\\") || line.startsWith("1/K0") )
                continue;
            if (line.length() > 2) {
                fileOutput.println(line.substring(indexOfNthCharacter(line, ' ', 2)));
            }
        }
        fileOutput.flush();
    }

    // find the index of not just the first but the n'th
    private int indexOfNthCharacter(String line, Character ch, int n){
        int found = 0, i = 0;
        for (; i < line.length(); ++i) {
            if (ch.equals(line.charAt(i))) {
                found++;
            }
            if (found == n) {
                return i;
            }
        }
        return -1;
    }

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

    public static void runPEAX(String inputFile, String outputFile, String parameters) throws IOException {
        Process peaxP = Runtime.getRuntime().exec(PEAX_PATH + " " + inputFile + " " + outputFile + " -p " + parameters);
        readProcess(peaxP);
    }

    public static void runRScript(String scriptFileName, boolean silence) throws IOException {
        Process rProcess = Runtime.getRuntime().exec("R -q --no-save < " + scriptFileName);
        if (!silence){
            readProcess(rProcess);
        }
    }

}