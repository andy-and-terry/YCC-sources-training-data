// Circular primes below 100; expect 13.
using System;
using System.Linq;

class CircularPrimes
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static bool Circular(int n)
    {
        string s = n.ToString();
        return Enumerable.Range(0, s.Length).All(i => IsPrime(int.Parse(s.Substring(i) + s.Substring(0, i))));
    }

    static void Main()
    {
        Console.WriteLine(Enumerable.Range(2, 98).Count(Circular));
    }
}
