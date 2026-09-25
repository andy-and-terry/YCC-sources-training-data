using System;
using System.Linq;
using System.Numerics;

class HammingDistance
{
    static int Of(string a, string b)
    {
        if (a.Length != b.Length) throw new ArgumentException("strings must have equal length");
        return a.Zip(b).Count(p => p.First != p.Second);
    }

    static int Of(ulong x, ulong y) => BitOperations.PopCount(x ^ y);

    static void Main()
    {
        Console.WriteLine($"{Of("karolin", "kathrin")} {Of(1UL, 4UL)} {Of(ulong.MaxValue, 0UL)}");
        try
        {
            Of("abc", "ab");
        }
        catch (ArgumentException e)
        {
            Console.WriteLine($"error: {e.Message}");
        }
    }
}
