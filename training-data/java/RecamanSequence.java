import java.util.HashSet;
import java.util.Set;

public class RecamanSequence {
    static int[] recaman(int count) {
        int[] seq = new int[count];
        Set<Integer> seen = new HashSet<>();
        seen.add(0);
        for (int n = 1; n < count; n++) {
            int next = seq[n - 1] - n;
            if (next < 0 || seen.contains(next)) next = seq[n - 1] + n;
            seq[n] = next;
            seen.add(next);
        }
        return seq;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int v : recaman(20)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
