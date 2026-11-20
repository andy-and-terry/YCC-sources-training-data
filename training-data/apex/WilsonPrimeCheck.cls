// Wilson's theorem primality test.
public class WilsonPrimeCheck {
    public static Boolean isPrime(Integer n) {
        if (n < 2) { return false; }
        Long f = 1;
        for (Integer i = 2; i < n; i++) { f = Math.mod(f * i, n); }
        return f == n - 1;
    }
}
