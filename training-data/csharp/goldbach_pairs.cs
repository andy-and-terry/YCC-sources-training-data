// Goldbach partitions of 100; expect 6.
using System;
using System.Linq;

class GoldbachPairs
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static void Main()
    {
        var pairs = Enumerable.Range(2, 49).Where(p => IsPrime(p) && IsPrime(100 - p)).Select(p => $"{p}+{100 - p}").ToList();
        Console.WriteLine($"{pairs.Count}: {string.Join(" ", pairs)}");
    }
}
