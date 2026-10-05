using System;
using System.Numerics;

class BitManipulationDemo
{
    static bool IsPowerOfTwo(uint n) => n != 0 && (n & (n - 1)) == 0;

    static uint SetBit(uint n, int i) => n | (1u << i);
    static uint ClearBit(uint n, int i) => n & ~(1u << i);
    static uint ToggleBit(uint n, int i) => n ^ (1u << i);

    static void Main()
    {
        uint value = 0b1011_0100;
        Console.WriteLine(Convert.ToString(value, 2));
        Console.WriteLine($"pop count: {BitOperations.PopCount(value)}");
        Console.WriteLine($"leading zeros: {BitOperations.LeadingZeroCount(value)}");
        Console.WriteLine($"trailing zeros: {BitOperations.TrailingZeroCount(value)}");
        Console.WriteLine($"set bit 0: {Convert.ToString(SetBit(value, 0), 2)}");
        Console.WriteLine($"clear bit 2: {Convert.ToString(ClearBit(value, 2), 2)}");
        Console.WriteLine($"toggle bit 7: {Convert.ToString(ToggleBit(value, 7), 2)}");
        Console.WriteLine($"is power of two (64): {IsPowerOfTwo(64)}");
        Console.WriteLine($"is power of two (66): {IsPowerOfTwo(66)}");
    }
}
