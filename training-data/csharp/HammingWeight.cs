using System;
using System.Numerics;

class HammingWeight
{
    static int Popcount(ulong n)
    {
        int c = 0;
        while (n != 0) { n &= n - 1; c++; }
        return c;
    }

    static void Main() => Console.WriteLine($"{Popcount(0xB7)} {BitOperations.PopCount(0xB7)}");
}
