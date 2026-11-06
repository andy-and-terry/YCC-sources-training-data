// Fermat primality test; Carmichael number 561 fools it.
public class FermatPrimality {
    static Long powmod(Long base, Long exp, Long m) {
        Long result = 1;
        base = Math.mod(base, m);
        while (exp > 0) {
            if (Math.mod(exp, 2) == 1) result = Math.mod(result * base, m);
            base = Math.mod(base * base, m);
            exp = exp / 2;
        }
        return result;
    }

    public static Boolean probablyPrime(Long n) {
        return n > 2 && powmod(2, n - 1, n) == 1;
    }

    public static void run() {
        for (Long n : new List<Long>{ 97, 91, 561 }) {
            System.debug(n + ' ' + probablyPrime(n));
        }
    }
}
