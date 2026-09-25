using System;
using System.Collections.Generic;
using System.Linq;

class PrimeFactorization
{
    static SortedDictionary<long, int> Factorize(long n)
    {
        var f = new SortedDictionary<long, int>();
        for (long d = 2; d * d <= n; d += d == 2 ? 1 : 2)
        {
            while (n % d == 0)
            {
                f[d] = f.GetValueOrDefault(d) + 1;
                n /= d;
            }
        }
        if (n > 1) f[n] = f.GetValueOrDefault(n) + 1;
        return f;
    }

    static void Main()
    {
        foreach (long n in new long[] { 360, 97, 1001, 82944, 600851475143 })
        {
            var f = Factorize(n);
            string text = string.Join(" * ", f.Select(kv => kv.Value > 1 ? $"{kv.Key}^{kv.Value}" : kv.Key.ToString()));
            int divisors = f.Values.Aggregate(1, (acc, e) => acc * (e + 1));
            Console.WriteLine($"{n} = {text} ({divisors} divisors)");
        }
    }
}
