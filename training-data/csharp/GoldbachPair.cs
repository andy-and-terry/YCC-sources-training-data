using System;
using System.Linq;

// Goldbach pair using LINQ.
class GoldbachPair {
    static bool IsPrime(int n) => n > 1 && Enumerable.Range(2, (int)Math.Sqrt(n) - 1).All(d => n % d != 0);
    static void Main() {
        int n = 28;
        int p = Enumerable.Range(2, n / 2 - 1).First(x => IsPrime(x) && IsPrime(n - x));
        Console.WriteLine($"{p} + {n - p}");
    }
}
