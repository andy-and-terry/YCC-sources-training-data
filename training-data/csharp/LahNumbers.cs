using System;
using System.Linq;

// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
class LahNumbers
{
    static long Fact(int n) => n <= 1 ? 1 : n * Fact(n - 1);
    static long Comb(int n, int k) => Fact(n) / (Fact(k) * Fact(n - k));

    static void Main()
    {
        int n = 5;
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, n).Select(k => Comb(n - 1, k - 1) * Fact(n) / Fact(k))));
    }
}
