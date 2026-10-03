import java.util.ArrayList;
import java.util.List;

public class ZAlgorithm {
    public static int[] zArray(String s) {
        int n = s.length();
        int[] z = new int[n];
        int l = 0, r = 0;
        for (int i = 1; i < n; i++) {
            if (i < r) z[i] = Math.min(r - i, z[i - l]);
            while (i + z[i] < n && s.charAt(z[i]) == s.charAt(i + z[i])) z[i]++;
            if (i + z[i] > r) {
                l = i;
                r = i + z[i];
            }
        }
        return z;
    }

    public static List<Integer> search(String text, String pattern) {
        String combined = pattern + "$" + text;
        int[] z = zArray(combined);
        int plen = pattern.length();
        List<Integer> matches = new ArrayList<>();
        for (int i = plen + 1; i < z.length; i++) {
            if (z[i] == plen) matches.add(i - plen - 1);
        }
        return matches;
    }

    public static void main(String[] args) {
        System.out.println(search("abxabcabcaby", "abc"));
    }
}
