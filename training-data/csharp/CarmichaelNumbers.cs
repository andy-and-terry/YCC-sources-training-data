using System;
using System.Linq;
using System.Numerics;

// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
class CarmichaelNumbers
{
    static bool IsPrime(int n)
    {
        for (int p = 2; p * p <= n; p++) if (n % p == 0) return false;
        return n > 1;
    }

    static bool IsCarmichael(int n)
    {
        if (IsPrime(n)) return false;
        for (int a = 2; a < n; a++)
            if (BigInteger.GreatestCommonDivisor(a, n) == 1 && BigInteger.ModPow(a, n - 1, n) != 1)
                return false;
        return true;
    }

    static void Main()
    {
        var found = Enumerable.Range(1, 1499).Select(i => 2 * i + 1).Where(IsCarmichael);
        Console.WriteLine(string.Join(" ", found));
    }
}
