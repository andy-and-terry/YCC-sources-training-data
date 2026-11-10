using System;
using System.Collections.Generic;

class SophieGermainPrimes
{
    static bool IsPrime(long n)
    {
        if (n < 2) return false;
        for (long i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    static void Main()
    {
        var found = new List<long>();
        for (long p = 2; found.Count < 10; p++)
            if (IsPrime(p) && IsPrime(2 * p + 1)) found.Add(p);
        Console.WriteLine(string.Join(" ", found)); // 2 3 5 11 23 29 41 53 83 89
    }
}
