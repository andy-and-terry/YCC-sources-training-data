// Circular primes below 100; expect 13.
public class CircularPrimes {
    static Boolean isPrime(Integer n) {
        if (n < 2) return false;
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d) == 0) return false;
        }
        return true;
    }

    static Boolean circular(Integer n) {
        String s = String.valueOf(n);
        for (Integer i = 0; i < s.length(); i++) {
            if (!isPrime(Integer.valueOf(s.substring(i) + s.substring(0, i)))) return false;
        }
        return true;
    }

    public static void run() {
        Integer c = 0;
        for (Integer n = 2; n < 100; n++) {
            if (circular(n)) c++;
        }
        System.debug(c);
    }
}
