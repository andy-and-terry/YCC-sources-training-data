import java.util.Map;
import java.util.StringJoiner;
import java.util.TreeMap;

public class PrimeFactorization {
    public static Map<Long, Integer> factorize(long n) {
        Map<Long, Integer> factors = new TreeMap<>();
        for (long d = 2; d * d <= n; d += (d == 2 ? 1 : 2)) {
            while (n % d == 0) {
                factors.merge(d, 1, Integer::sum);
                n /= d;
            }
        }
        if (n > 1) factors.merge(n, 1, Integer::sum);
        return factors;
    }

    public static String format(Map<Long, Integer> f) {
        StringJoiner j = new StringJoiner(" * ");
        f.forEach((p, e) -> j.add(e > 1 ? p + "^" + e : String.valueOf(p)));
        return j.toString();
    }

    public static void main(String[] args) {
        for (long n : new long[] {360, 97, 1001, 82944, 600851475143L}) {
            System.out.println(n + " = " + format(factorize(n)));
        }
    }
}
