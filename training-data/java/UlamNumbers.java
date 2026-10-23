import java.util.HashSet;
import java.util.Set;

public class UlamNumbers {
    static int[] ulam(int count) {
        int[] terms = new int[count];
        terms[0] = 1;
        terms[1] = 2;
        int len = 2;
        Set<Integer> members = new HashSet<>();
        members.add(1);
        members.add(2);
        for (int cand = 3; len < count; cand++) {
            int ways = 0;
            for (int i = 0; i < len; i++) {
                int a = terms[i];
                if (a < cand - a && members.contains(cand - a)) ways++;
            }
            if (ways == 1) {
                terms[len++] = cand;
                members.add(cand);
            }
        }
        return terms;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int v : ulam(15)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
