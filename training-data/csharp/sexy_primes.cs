// Sexy primes below 100; expect 16 pairs.
using System;
using System.Linq;

class SexyPrimes
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static void Main()
    {
        Console.WriteLine(Enumerable.Range(2, 98).Count(p => IsPrime(p) && IsPrime(p + 6)));
    }
}
