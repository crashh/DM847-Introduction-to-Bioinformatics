import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class SuffixArray {
    // Used instead of $, because of the lexicographical order defined by Java
    private static final String TERMINATOR = "~";

    private static List<String> generateSuffixes(String input) {
        List<String> result = new ArrayList<>();
        for (int i = 0; i < input.length(); i++) {
            result.add(input.substring(i));
        }
        return result;
    }

    private static List<Integer> computeLargestCommonPrefixes(List<String> prefixes) {
        List<Integer> result = new ArrayList<>();
        result.add(0); // The first entry is always 0
        for (int i = 0; i < prefixes.size() - 1; i++) {
            result.add(computeLargestCommonPrefix(prefixes.get(i), prefixes.get(i + 1)));
        }
        return result;
    }

    private static int computeLargestCommonPrefix(String a, String b) {
        for (int i = 0; i < Math.min(a.length(), b.length()); i++) {
            if (a.charAt(i) != b.charAt(i)) {
                return i;
            }
        }
        return Math.min(a.length(), b.length());
    }

    private static List<Integer> computeSkipList(List<Integer> largestCommonPrefixes) {
        List<Integer> result = new ArrayList<>();
        int idx = 0;
        for (int lcp : largestCommonPrefixes) {
            int size = largestCommonPrefixes.size();
            boolean added = false;
            for (int i = idx + 1; i < size; i++) {
                if (lcp > largestCommonPrefixes.get(i)) {
                    result.add(i);
                    added = true;
                    break;
                }
            }
            if (!added) result.add(size);
            idx++;
        }
        return result;
    }

    public static void main(String[] args) {
        List<String> suffixes = generateSuffixes("caaaaccacac" + TERMINATOR);
        System.out.println(suffixes);
        suffixes.sort(Comparator.naturalOrder());
        System.out.println(suffixes);
        List<Integer> largestCommonPrefixes = computeLargestCommonPrefixes(suffixes);
        System.out.println(largestCommonPrefixes);
        List<Integer> skipList = computeSkipList(largestCommonPrefixes);
        System.out.println(skipList);
    }
}
