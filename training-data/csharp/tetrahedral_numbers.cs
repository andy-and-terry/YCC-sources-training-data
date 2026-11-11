// Tetrahedral numbers n(n+1)(n+2)/6
using System;
using System.Linq;

class TetrahedralNumbers
{
    static long Term(long n) => ((n * (n + 1)) * (n + 2))/6;

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(n => Term(n))));
    }
}
