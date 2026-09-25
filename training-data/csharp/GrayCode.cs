using System;
using System.Linq;
using System.Numerics;

class GrayCode
{
    static uint ToGray(uint n) => n ^ (n >> 1);

    static uint FromGray(uint g)
    {
        for (int shift = 1; shift < 32; shift <<= 1) g ^= g >> shift;
        return g;
    }

    static void Main()
    {
        var codes = Enumerable.Range(0, 16).Select(i => ToGray((uint)i)).ToArray();
        for (int i = 0; i < codes.Length; i++)
            Console.WriteLine($"{i,2} {Convert.ToString(codes[i], 2).PadLeft(4, '0')} {FromGray(codes[i]),2}");
        bool ok = codes.Zip(codes.Skip(1)).All(p => BitOperations.PopCount(p.First ^ p.Second) == 1);
        Console.WriteLine($"adjacent codes differ by one bit: {ok}");
    }
}
