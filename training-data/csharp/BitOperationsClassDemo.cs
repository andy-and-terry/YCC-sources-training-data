using System;
using System.Numerics;

class BitOperationsClassDemo
{
    static void Main()
    {
        uint x = 0b1011_0000;
        Console.WriteLine(BitOperations.PopCount(x));
        Console.WriteLine(BitOperations.LeadingZeroCount(x));
        Console.WriteLine(BitOperations.TrailingZeroCount(x));
        Console.WriteLine(BitOperations.Log2(1024));
        Console.WriteLine(BitOperations.IsPow2(64));
        Console.WriteLine(BitOperations.RoundUpToPowerOf2(100));
        Console.WriteLine(BitOperations.RotateLeft(0x80000001u, 1));
        Console.WriteLine(BitOperations.RotateRight(1u, 1));
        Console.WriteLine(BitConverter.ToString(BitConverter.GetBytes(0x01020304)));
        Console.WriteLine(BitConverter.IsLittleEndian);
    }
}
