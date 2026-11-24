using System;
using System.Linq;

// Fibbinary numbers: no two adjacent 1 bits.
class FibbinaryNumbers
{
    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 50).Where(n => (n & (n >> 1)) == 0)));
}
