// Sophie Germain primes: p prime and 2p + 1 prime.
public class SophieGermainPrimes {
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
            if (isPrime(p) && isPrime(2 * p + 1)) out.add(p);
        }
        System.debug(String.join(out, ' '));
    }
}
