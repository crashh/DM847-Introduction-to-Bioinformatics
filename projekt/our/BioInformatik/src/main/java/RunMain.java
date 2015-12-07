/**
 * Created by anders on 12/7/15.
 */
public class RunMain {
    public static void main(String[] args) throws Exception {

        new InOutput("example1.csv", "clean1.csv").prepareMatrix();
        InOutput.runPEAX("clean1.csv", "peax1", "./peax/parameters.cfg");
    }

}
