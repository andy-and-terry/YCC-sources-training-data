import java.util.ArrayList;
import java.util.List;

public class CollatzSequence {
    public static List<Long> sequence(long n) {
        List<Long> seq = new ArrayList<>();
        seq.add(n);
        while (n != 1) {
            n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
            seq.add(n);
        }
        return seq;
    }

    public static void main(String[] args) {
        int limit = 1_000_000;
        int[] cache = new int[limit];
        int best = 1;
        for (int i = 2; i < limit; i++) {
            long n = i;
            int steps = 0;
            while (n >= i) {
                n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
                steps++;
            }
            cache[i] = steps + cache[(int) n];
            if (cache[i] > cache[best]) best = i;
        }
        System.out.println(sequence(27).subList(0, 10) + " ... length " + sequence(27).size());
        System.out.println("longest under 1e6: " + best + " (" + cache[best] + " steps)");
    }
}
