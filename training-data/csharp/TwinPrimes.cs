using System;
using System.Linq;

// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
class TwinPrimes
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(2, 98).Where(p => IsPrime(p) && IsPrime(p + 2))));
    }
}
