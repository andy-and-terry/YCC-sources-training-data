import java.util.ArrayList;
import java.util.List;

public class LyndonFactorization {
    static List<String> duval(String s) {
        List<String> out = new ArrayList<>();
        int n = s.length(), i = 0;
        while (i < n) {
            int j = i + 1, k = i;
            while (j < n && s.charAt(k) <= s.charAt(j)) {
                k = s.charAt(k) < s.charAt(j) ? i : k + 1;
                j++;
            }
            while (i <= k) {
                out.add(s.substring(i, i + j - k));
                i += j - k;
            }
        }
        return out;
    }

    public static void main(String[] args) {
        System.out.println(duval("banana"));
    }
}
