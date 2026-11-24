using System;
using System.Linq;

// Pentagonal numbers: n(3n-1)/2.
class PentagonalNumbers
{
    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 10).Select(n => n * (3 * n - 1) / 2)));
}
