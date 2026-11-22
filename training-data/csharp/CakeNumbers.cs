using System;
using System.Linq;

// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
class CakeNumbers
{
    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(n => (n * n * n + 5 * n + 6) / 6)));
    }
}
