using System;
using System.Linq;

// Hexagonal numbers: n(2n-1).
class HexagonalNumbers
{
    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 10).Select(n => n * (2 * n - 1))));
}
