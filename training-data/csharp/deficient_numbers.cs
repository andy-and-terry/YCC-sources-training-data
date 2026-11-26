// Deficient numbers below 100; expect 76.
using System;
using System.Linq;

class DeficientNumbers
{
    static int ProperSum(int n) => Enumerable.Range(1, n - 1).Where(d => n % d == 0).Sum();

    static void Main()
    {
        Console.WriteLine(Enumerable.Range(1, 99).Count(n => ProperSum(n) < n));
    }
}
