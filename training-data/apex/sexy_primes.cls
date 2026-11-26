// Sexy primes below 100; expect 16 pairs.
public class SexyPrimes {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d) == 0) return false;
        }
        return true;
    }

    public static void run() {
        Integer c = 0;
        for (Integer p = 2; p < 100; p++) {
            if (isPrime(p) && isPrime(p + 6)) c++;
        }
        System.debug(c);
    }
}
