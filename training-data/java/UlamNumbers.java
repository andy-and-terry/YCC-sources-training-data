import java.util.ArrayList;
import java.util.List;

public class UlamNumbers {
    static List<Integer> ulam(int count) {
        List<Integer> seq = new ArrayList<>(List.of(1, 2));
        for (int n = 3; seq.size() < count; n++) {
            int ways = 0;
            for (int a : seq) {
                if (a < n - a && seq.contains(n - a)) ways++;
            }
            if (ways == 1) seq.add(n);
        }
        return seq;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int v : ulam(15)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
