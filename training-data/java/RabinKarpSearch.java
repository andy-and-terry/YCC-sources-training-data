import java.util.ArrayList;
import java.util.List;

public class RabinKarpSearch {
    private static final int BASE = 256;
    private static final int MOD = 1_000_000_007;

    public static List<Integer> search(String text, String pattern) {
        List<Integer> matches = new ArrayList<>();
        int n = text.length();
        int m = pattern.length();
        if (m > n || m == 0) return matches;

        long highOrder = 1;
        for (int i = 0; i < m - 1; i++) {
            highOrder = (highOrder * BASE) % MOD;
        }

        long patternHash = 0;
        long windowHash = 0;
        for (int i = 0; i < m; i++) {
            patternHash = (patternHash * BASE + pattern.charAt(i)) % MOD;
            windowHash = (windowHash * BASE + text.charAt(i)) % MOD;
        }

        for (int i = 0; i <= n - m; i++) {
            if (patternHash == windowHash && text.substring(i, i + m).equals(pattern)) {
                matches.add(i);
            }
            if (i < n - m) {
                windowHash = (windowHash - text.charAt(i) * highOrder % MOD + MOD) % MOD;
                windowHash = (windowHash * BASE + text.charAt(i + m)) % MOD;
            }
        }
        return matches;
    }

    public static void main(String[] args) {
        System.out.println(search("abxabcabcaby", "abc"));
    }
}
