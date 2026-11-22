// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
public class TwinPrimes {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d) == 0) return false;
        }
        return true;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer p = 2; p < 100; p++) {
            if (isPrime(p) && isPrime(p + 2)) out.add(p);
        }
        System.debug(String.join(out, ' '));
    }
}
