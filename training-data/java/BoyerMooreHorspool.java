import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BoyerMooreHorspool {
    public static List<Integer> search(String text, String pattern) {
        int m = pattern.length(), n = text.length();
        List<Integer> matches = new ArrayList<>();
        if (m == 0) return List.of(0);
        int[] shift = new int[Character.MAX_VALUE + 1];
        Arrays.fill(shift, m);
        for (int i = 0; i < m - 1; i++) shift[pattern.charAt(i)] = m - 1 - i;
        int i = 0;
        while (i <= n - m) {
            int j = m - 1;
            while (j >= 0 && text.charAt(i + j) == pattern.charAt(j)) j--;
            if (j < 0) matches.add(i);
            i += shift[text.charAt(i + m - 1)];
        }
        return matches;
    }

    public static void main(String[] args) {
        System.out.println(search("here is a simple example, an example indeed", "example"));
    }
}
