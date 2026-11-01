using System;
using System.Linq;

// Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
class RuthAaronPairs
{
    static int Sopfr(int n)
    {
        int total = 0;
        for (int p = 2; p * p <= n; p++)
            while (n % p == 0) { total += p; n /= p; }
        return total + (n > 1 ? n : 0);
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ",
            Enumerable.Range(2, 108).Where(n => Sopfr(n) == Sopfr(n + 1))));
}
