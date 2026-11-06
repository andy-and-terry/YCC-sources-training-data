// Emirps: primes whose digit reversal is a different prime.
public class EmirpNumbers {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer i = 2; i * i <= n; i++) {
            if (Math.mod(n, i) == 0) return false;
        }
        return true;
    }

    static Integer reverseDigits(Integer n) {
        return Integer.valueOf(n.toString().reverse());
    }

    public static void run() {
        List<Integer> emirps = new List<Integer>();
        for (Integer n = 2; n < 100; n++) {
            Integer r = reverseDigits(n);
            if (r != n && isPrime(n) && isPrime(r)) emirps.add(n);
        }
        System.debug(emirps);
    }
}
