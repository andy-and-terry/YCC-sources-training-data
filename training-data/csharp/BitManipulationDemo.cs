using System;
using System.Numerics;

class BitManipulationDemo
{
    static void Main()
    {
        uint n = 0b1011_0100;
        Console.WriteLine(BitOperations.PopCount(n));
        Console.WriteLine(BitOperations.TrailingZeroCount(n));
        Console.WriteLine(BitOperations.LeadingZeroCount(n));
        Console.WriteLine(BitOperations.IsPow2(64u));
        Console.WriteLine(BitOperations.RotateLeft(n, 4));
        Console.WriteLine(Convert.ToString(n & (~n + 1), 2));
        Console.WriteLine((n >> 2) & 1);
        Console.WriteLine(Convert.ToString((int)(n ^ 0xFF), 2));
        Console.WriteLine(BitOperations.Log2(1024));
    }
}
