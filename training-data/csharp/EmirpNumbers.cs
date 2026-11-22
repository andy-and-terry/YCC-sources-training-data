using System;
using System.Linq;

// Emirps: primes whose digit reversal is a different prime.
class EmirpNumbers
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static void Main()
    {
        var emirps = Enumerable.Range(2, 198).Where(n =>
        {
            int r = int.Parse(new string(n.ToString().Reverse().ToArray()));
            return r != n && IsPrime(n) && IsPrime(r);
        });
        Console.WriteLine(string.Join(" ", emirps));
    }
}
