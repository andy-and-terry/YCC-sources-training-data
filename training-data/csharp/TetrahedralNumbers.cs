using System;
using System.Linq;

// Tetrahedral numbers: n(n+1)(n+2)/6.
class TetrahedralNumbers
{
    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 10).Select(n => n * (n + 1) * (n + 2) / 6)));
}
