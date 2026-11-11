// Centered square numbers 2n(n+1)+1
using System;
using System.Linq;

class CenteredSquareNumbers
{
    static long Term(long n) => ((2 * n) * (n + 1)) + 1;

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(n => Term(n))));
    }
}
