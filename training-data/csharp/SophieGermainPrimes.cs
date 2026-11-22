using System;
using System.Linq;

// Sophie Germain primes: p prime and 2p + 1 prime.
class SophieGermainPrimes
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(2, 98).Where(p => IsPrime(p) && IsPrime(2 * p + 1))));
    }
}
