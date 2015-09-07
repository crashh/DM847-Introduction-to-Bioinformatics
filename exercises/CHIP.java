import java.io.FileNotFoundException;
import java.util.LinkedList;
import java.io.File;
import java.util.Scanner;

class CHIP {
	class input {
		static final char INCREASE = '+';
		static final char DECREASE = '-';

		int value;
		char type;
	}

	public
	static void smooth() {

	}

	public void maxima() {

	}

	public void minima() {

	}

	public
	static void main(String args[] ) {
		LinkedList<Integer> forward;
		LinkedList<Integer> backward;

		try {
			Scanner input = new Scanner(new File(args[0]));

			while (input.hasNext()) {
				int values[] = new int[2];
				values[0] = input.nextInt();
				values[1] = input.nextInt();
				char type = 
			}
		} catch (FileNotFoundException e) {

		}
	}
}
