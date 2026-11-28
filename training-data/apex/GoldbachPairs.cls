public class GoldbachPairs {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d) == 0) return false;
        }
        return true;
    }

    public static List<String> pairs(Integer n) {
        List<String> out = new List<String>();
        for (Integer p = 2; p <= n / 2; p++) {
            if (isPrime(p) && isPrime(n - p)) {
                out.add(p + ' + ' + (n - p));
            }
        }
        return out;
    }
}
