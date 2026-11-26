// Primorials up to 1e6, including 1; expect 8.
using System;
using System.Linq;

class PrimorialNumbers
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static void Main()
    {
        var values = new System.Collections.Generic.List<long> { 1 };
        long acc = 1;
        for (int p = 2; ; p++)
        {
            if (!IsPrime(p)) continue;
            acc *= p;
            if (acc > 1000000) break;
            values.Add(acc);
        }
        Console.WriteLine($"{values.Count}: {string.Join(" ", values)}");
    }
}
