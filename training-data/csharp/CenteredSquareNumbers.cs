using System;
using System.Linq;

// Centered square numbers: n^2 + (n+1)^2.
class CenteredSquareNumbers
{
    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(n => n * n + (n + 1) * (n + 1))));
}
