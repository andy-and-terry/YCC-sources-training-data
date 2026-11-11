// Population count (number of set bits) for 0..15
using System;
using System.Linq;
using System.Numerics;

class PopcountTable
{
    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 16).Select(n => BitOperations.PopCount((uint)n))));
    }
}
