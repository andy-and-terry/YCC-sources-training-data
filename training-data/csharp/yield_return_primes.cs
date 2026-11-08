using System;
using System.Collections.Generic;
using System.Linq;

class YieldReturnPrimes
{
    static IEnumerable<int> Primes()
    {
        var found = new List<int>();
        for (int n = 2; ; n++)
        {
            if (found.All(p => n % p != 0))
            {
                found.Add(n);
                yield return n;
            }
        }
    }

    static void Main() => Console.WriteLine(string.Join(" ", Primes().Take(10)));
}
