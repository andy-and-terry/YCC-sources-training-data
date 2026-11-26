// Twin primes below 100; expect 8.
public class TwinPrimes {
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
            if (isPrime(p) && isPrime(p + 2)) c++;
        }
        System.debug(c);
    }
}
