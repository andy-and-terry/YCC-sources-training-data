import java.util.ArrayList;
import java.util.List;

public class ZAlgorithm {
    private static final char SEPARATOR = '\u0001';

    public static int[] buildZArray(String s) {
        int n = s.length();
        int[] z = new int[n];
        int left = 0, right = 0;
        for (int i = 1; i < n; i++) {
            if (i < right) {
                z[i] = Math.min(right - i, z[i - left]);
            }
            while (i + z[i] < n && s.charAt(z[i]) == s.charAt(i + z[i])) {
                z[i]++;
            }
            if (i + z[i] > right) {
                left = i;
                right = i + z[i];
            }
        }
        return z;
    }

    public static List<Integer> search(String text, String pattern) {
        String combined = pattern + SEPARATOR + text;
        int[] z = buildZArray(combined);
        List<Integer> matches = new ArrayList<>();
        int patternLen = pattern.length();
        for (int i = patternLen + 1; i < combined.length(); i++) {
            if (z[i] == patternLen) {
                matches.add(i - patternLen - 1);
            }
        }
        return matches;
    }

    public static void main(String[] args) {
        System.out.println(search("abxabcabcaby", "abcaby"));
        System.out.println(search("aaaaa", "aa"));
    }
}
