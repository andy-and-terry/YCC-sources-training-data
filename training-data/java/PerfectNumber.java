import java.util.EnumMap;
import java.util.Map;

public class PerfectNumber {
    enum Kind { PERFECT, ABUNDANT, DEFICIENT }

    public static long divisorSum(long n) {
        if (n < 2) return 0;
        long total = 1;
        for (long i = 2; i * i <= n; i++) {
            if (n % i == 0) {
                total += i;
                if (i != n / i) total += n / i;
            }
        }
        return total;
    }

    public static Kind classify(long n) {
        long s = divisorSum(n);
        return s == n ? Kind.PERFECT : s > n ? Kind.ABUNDANT : Kind.DEFICIENT;
    }

    public static void main(String[] args) {
        Map<Kind, Integer> counts = new EnumMap<>(Kind.class);
        for (int n = 2; n <= 10000; n++) counts.merge(classify(n), 1, Integer::sum);
        System.out.println(counts);
        System.out.println(classify(33550336L));
    }
}
