// Primorials up to 1e6, including 1; expect 8.
public class PrimorialNumbers {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d) == 0) return false;
        }
        return true;
    }

    public static void run() {
        List<Long> values = new List<Long>{ 1L };
        Long acc = 1L;
        for (Integer p = 2; ; p++) {
            if (!isPrime(p)) continue;
            acc *= p;
            if (acc > 1000000L) break;
            values.add(acc);
        }
        System.debug(values.size() + ': ' + values);
    }
}
