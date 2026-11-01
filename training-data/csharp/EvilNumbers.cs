using System;
using System.Linq;
using System.Numerics;

// Evil numbers have an even number of 1 bits.
class EvilNumbers
{
    static void Main() =>
        Console.WriteLine(string.Join(" ",
            Enumerable.Range(0, 21).Where(n => BitOperations.PopCount((uint)n) % 2 == 0)));
}
