using System;
using System.Numerics;

class LahNumbers
{
    static BigInteger Fact(int n) { BigInteger r = 1; for (int i = 2; i <= n; i++) r *= i; return r; }
    static BigInteger Comb(int n, int k) => Fact(n) / (Fact(k) * Fact(n - k));
    static BigInteger Lah(int n, int k) => Comb(n - 1, k - 1) * Fact(n) / Fact(k);

    static void Main()
    {
        for (int n = 1; n <= 5; n++)
        {
            for (int k = 1; k <= n; k++) Console.Write(Lah(n, k) + " ");
            Console.WriteLine();
        }
    }
}
