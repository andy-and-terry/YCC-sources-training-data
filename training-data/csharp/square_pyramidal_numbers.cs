// Square pyramidal numbers n(n+1)(2n+1)/6
using System;
using System.Linq;

class SquarePyramidalNumbers
{
    static long Term(long n) => ((n * (n + 1)) * ((2 * n) + 1))/6;

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(n => Term(n))));
    }
}
