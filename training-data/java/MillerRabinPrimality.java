import java.math.BigInteger;
import java.util.Random;

public class MillerRabinPrimality {
    private static final Random RANDOM = new Random(42);

    public static boolean isProbablyPrime(long n, int rounds) {
        if (n < 2) return false;
        if (n == 2 || n == 3) return true;
        if (n % 2 == 0) return false;

        long d = n - 1;
        int r = 0;
        while (d % 2 == 0) {
            d /= 2;
            r++;
        }

        for (int i = 0; i < rounds; i++) {
            long a = 2 + (long) (RANDOM.nextDouble() * (n - 4));
            long x = BigInteger.valueOf(a).modPow(BigInteger.valueOf(d), BigInteger.valueOf(n)).longValue();
            if (x == 1 || x == n - 1) continue;

            boolean composite = true;
            for (int j = 0; j < r - 1; j++) {
                x = BigInteger.valueOf(x).modPow(BigInteger.valueOf(2), BigInteger.valueOf(n)).longValue();
                if (x == n - 1) {
                    composite = false;
                    break;
                }
            }
            if (composite) return false;
        }
        return true;
    }

    public static void main(String[] args) {
        long[] candidates = {97, 561, 7919, 100, 104729, 1_000_000_007L};
        for (long n : candidates) {
            System.out.println(n + " -> " + isProbablyPrime(n, 20));
        }
    }
}
