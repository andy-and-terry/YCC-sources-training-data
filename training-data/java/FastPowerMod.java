import java.math.BigInteger;

public class FastPowerMod {
    public static long mulMod(long a, long b, long m) {
        if (m <= 3_037_000_499L) return a * b % m; // product fits in a long
        return BigInteger.valueOf(a).multiply(BigInteger.valueOf(b)).mod(BigInteger.valueOf(m)).longValue();
    }

    public static long powMod(long base, long exp, long mod) {
        long result = 1 % mod;
        base = Math.floorMod(base, mod);
        while (exp > 0) {
            if ((exp & 1) == 1) result = mulMod(result, base, mod);
            base = mulMod(base, base, mod);
            exp >>= 1;
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(powMod(2, 10, 1000) + " " + powMod(3, 200, 13) + " " + powMod(7, 1_000_000_000_000_000_000L, 1_000_000_007));
        long big = 9_223_372_036_854_775_783L; // large prime near Long.MAX_VALUE
        System.out.println(powMod(2, big - 1, big) + " == " + BigInteger.TWO.modPow(BigInteger.valueOf(big - 1), BigInteger.valueOf(big)));
    }
}
