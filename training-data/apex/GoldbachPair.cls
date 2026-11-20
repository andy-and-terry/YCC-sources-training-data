// Goldbach pair.
public class GoldbachPair {
    public static Boolean isPrime(Integer n) {
        if (n < 2) { return false; }
        for (Integer d = 2; d * d <= n; d++) { if (Math.mod(n, d) == 0) { return false; } }
        return true;
    }
    public static List<Integer> find(Integer n) {
        for (Integer p = 2; p <= n / 2; p++) {
            if (isPrime(p) && isPrime(n - p)) { return new List<Integer>{ p, n - p }; }
        }
        return null;
    }
}
