using System;
using System.Linq;

class GoldbachPairs
{
    static bool IsPrime(int n) => n > 1 && Enumerable.Range(2, Math.Max(0, (int)Math.Sqrt(n) - 1)).All(d => n % d != 0);

    static void Main()
    {
        int n = 28;
        foreach (var p in Enumerable.Range(2, n / 2 - 1).Where(p => IsPrime(p) && IsPrime(n - p)))
            Console.WriteLine($"{p} + {n - p}");
    }
}
