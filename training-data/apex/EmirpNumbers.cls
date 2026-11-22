// Emirps: primes whose digit reversal is a different prime.
public class EmirpNumbers {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d) == 0) return false;
        }
        return true;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 2; n < 200; n++) {
            Integer r = Integer.valueOf(String.valueOf(n).reverse());
            if (r != n && isPrime(n) && isPrime(r)) out.add(n);
        }
        System.debug(String.join(out, ' '));
    }
}
