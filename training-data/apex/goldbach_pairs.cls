// Goldbach partitions of 100; expect 6.
public class GoldbachPairs {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d) == 0) return false;
        }
        return true;
    }

    public static void run() {
        List<String> pairs = new List<String>();
        for (Integer p = 2; p <= 50; p++) {
            if (isPrime(p) && isPrime(100 - p)) pairs.add(p + '+' + (100 - p));
        }
        System.debug(pairs.size() + ': ' + pairs);
    }
}
