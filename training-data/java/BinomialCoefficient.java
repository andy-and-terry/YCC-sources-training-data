import java.math.BigInteger;

public class BinomialCoefficient {
    public static BigInteger exact(int n, int k) {
        if (k < 0 || k > n) return BigInteger.ZERO;
        k = Math.min(k, n - k);
        BigInteger r = BigInteger.ONE;
        for (int i = 1; i <= k; i++) r = r.multiply(BigInteger.valueOf(n - k + i)).divide(BigInteger.valueOf(i));
        return r;
    }

    /** Precomputes factorials to answer nCk mod p queries in O(1). */
    static final class ModTable {
        final long mod;
        final long[] fact, inv;

        ModTable(int n, long mod) {
            this.mod = mod;
            fact = new long[n + 1];
            inv = new long[n + 1];
            fact[0] = 1;
            for (int i = 1; i <= n; i++) fact[i] = fact[i - 1] * i % mod;
            inv[n] = BigInteger.valueOf(fact[n]).modInverse(BigInteger.valueOf(mod)).longValue();
            for (int i = n; i > 0; i--) inv[i - 1] = inv[i] * i % mod;
        }

        long choose(int n, int k) {
            return k < 0 || k > n ? 0 : fact[n] * inv[k] % mod * inv[n - k] % mod;
        }
    }

    public static void main(String[] args) {
        System.out.println(exact(10, 3) + " " + exact(52, 5) + " " + exact(100, 50));
        ModTable t = new ModTable(1_000_000, 1_000_000_007L);
        System.out.println(t.choose(1000, 500) + " " + exact(1000, 500).mod(BigInteger.valueOf(1_000_000_007L)));
    }
}
