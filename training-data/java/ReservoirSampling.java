import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

public class ReservoirSampling {
    // Pick k items uniformly from a stream of unknown length in one pass.
    static int[] sample(IntStream stream, int k, Random rnd) {
        int[] res = new int[k];
        int[] seen = {0};
        stream.forEach(x -> {
            int n = seen[0]++;
            if (n < k) {
                res[n] = x;
            } else {
                int j = rnd.nextInt(n + 1);
                if (j < k) res[j] = x;
            }
        });
        return res;
    }

    public static void main(String[] args) {
        Random rnd = new Random(42);
        int[] picked = sample(IntStream.rangeClosed(1, 100), 5, rnd);
        System.out.println(picked.length + " " + Arrays.stream(picked).allMatch(v -> v >= 1 && v <= 100));
    }
}
