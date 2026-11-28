using System;
using System.Collections.Generic;
using System.Linq;

class CubanPrimes
{
    static bool IsPrime(long n)
    {
        if (n < 2) return false;
        for (long i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    static IEnumerable<long> Cuban()
    {
        for (long y = 1; ; y++)
        {
            long p = 3 * y * y + 3 * y + 1;
            if (IsPrime(p)) yield return p;
        }
    }

    static void Main() => Console.WriteLine(string.Join(" ", Cuban().Take(8)));
}
