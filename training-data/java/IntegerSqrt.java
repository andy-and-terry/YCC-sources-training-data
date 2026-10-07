import java.math.BigInteger;

public class IntegerSqrt {
    public static long isqrt(long n) {
        if (n < 0) throw new IllegalArgumentException("negative");
        long r = (long) Math.sqrt((double) n);
        while (r > n / Math.max(r, 1)) r--;  // r*r > n, overflow-safe
        while (r + 1 <= n / (r + 1)) r++;     // (r+1)^2 <= n, overflow-safe
        return r;
    }

    public static BigInteger isqrt(BigInteger n) {
        if (n.signum() < 0) throw new IllegalArgumentException("negative");
        if (n.compareTo(BigInteger.TWO) < 0) return n;
        BigInteger x = BigInteger.ONE.shiftLeft(n.bitLength() / 2 + 1);
        while (true) {
            BigInteger y = x.add(n.divide(x)).shiftRight(1);
            if (y.compareTo(x) >= 0) return x;
            x = y;
        }
    }

    public static void main(String[] args) {
        for (long n : new long[] {0, 1, 15, 16, 17, Long.MAX_VALUE}) System.out.println(n + " -> " + isqrt(n));
        BigInteger big = BigInteger.TEN.pow(50).add(BigInteger.valueOf(12345));
        System.out.println(isqrt(big) + " (matches sqrt(): " + isqrt(big).equals(big.sqrt()) + ")");
    }
}
