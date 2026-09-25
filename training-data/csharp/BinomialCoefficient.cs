using System;
using System.Numerics;

class BinomialCoefficient
{
    static BigInteger Exact(int n, int k)
    {
        if (k < 0 || k > n) return 0;
        k = Math.Min(k, n - k);
        BigInteger r = 1;
        for (int i = 1; i <= k; i++) r = r * (n - k + i) / i;
        return r;
    }

    sealed class ModTable
    {
        readonly long mod;
        readonly long[] fact, inv;

        public ModTable(int n, long mod)
        {
            this.mod = mod;
            fact = new long[n + 1];
            inv = new long[n + 1];
            fact[0] = 1;
            for (int i = 1; i <= n; i++) fact[i] = fact[i - 1] * i % mod;
            inv[n] = (long)BigInteger.ModPow(fact[n], mod - 2, mod);
            for (int i = n; i > 0; i--) inv[i - 1] = inv[i] * i % mod;
        }

        public long this[int n, int k] => k < 0 || k > n ? 0 : fact[n] * inv[k] % mod * inv[n - k] % mod;
    }

    static void Main()
    {
        Console.WriteLine($"{Exact(10, 3)} {Exact(52, 5)} {Exact(100, 50)}");
        var t = new ModTable(1_000_000, 1_000_000_007);
        Console.WriteLine($"{t[1000, 500]} {Exact(1000, 500) % 1_000_000_007}");
    }
}
