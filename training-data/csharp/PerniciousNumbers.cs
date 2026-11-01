using System;
using System.Linq;
using System.Numerics;

// Pernicious numbers: the popcount is prime.
class PerniciousNumbers
{
    static bool IsPrime(int n) =>
        n >= 2 && Enumerable.Range(2, Math.Max(0, (int)Math.Sqrt(n) - 1)).All(d => n % d != 0);

    static void Main() =>
        Console.WriteLine(string.Join(" ",
            Enumerable.Range(1, 20).Where(n => IsPrime(BitOperations.PopCount((uint)n)))));
}
