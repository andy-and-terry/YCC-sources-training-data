// Fermat primality test; Carmichael number 561 fools it.
import java.math.BigInteger;

public class FermatPrimality {
    static boolean probablyPrime(long n) {
        return n > 2 && BigInteger.TWO.modPow(BigInteger.valueOf(n - 1), BigInteger.valueOf(n)).equals(BigInteger.ONE);
    }

    public static void main(String[] args) {
        for (long n : new long[] {97, 91, 561})
            System.out.println(n + " " + probablyPrime(n));
    }
}
