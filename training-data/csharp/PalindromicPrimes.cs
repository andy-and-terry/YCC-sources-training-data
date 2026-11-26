// Palindromic primes below 200; expect 10.
using System;
using System.Linq;

class PalindromicPrimes
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static void Main()
    {
        var found = Enumerable.Range(2, 198)
            .Where(n => n.ToString() == new string(n.ToString().Reverse().ToArray()) && IsPrime(n))
            .ToList();
        Console.WriteLine(string.Join(" ", found));
        Console.WriteLine(found.Count);
    }
}
