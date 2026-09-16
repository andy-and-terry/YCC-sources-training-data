import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MillerRabinTest {
    public static boolean isProbablePrime(long n, int rounds) {
        if (n < 2) return false;
        if (n == 2 || n == 3) return true;
        if (n % 2 == 0) return false;

        long d = n - 1;
        int r = 0;
        while (d % 2 == 0) {
            d /= 2;
            r++;
        }

        Random rand = new Random(42);
        for (int i = 0; i < rounds; i++) {
            long a = 2 + (Math.abs(rand.nextLong()) % (n - 3));
            BigInteger x = BigInteger.valueOf(a).modPow(BigInteger.valueOf(d), BigInteger.valueOf(n));
            if (x.equals(BigInteger.ONE) || x.equals(BigInteger.valueOf(n - 1))) continue;

            boolean composite = true;
            for (int j = 0; j < r - 1; j++) {
                x = x.multiply(x).mod(BigInteger.valueOf(n));
                if (x.equals(BigInteger.valueOf(n - 1))) {
                    composite = false;
                    break;
                }
            }
            if (composite) return false;
        }
        return true;
    }

    public static void main(String[] args) {
        List<Long> primes = new ArrayList<>();
        for (long n = 2; n < 100; n++) {
            if (isProbablePrime(n, 5)) primes.add(n);
        }
        System.out.println(primes);
        System.out.println(isProbablePrime(104729L, 10));
        System.out.println(isProbablePrime(104728L, 10));
    }
}
