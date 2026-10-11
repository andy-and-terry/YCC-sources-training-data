using System;

class StackallocDemo
{
    static string ToBinary(int value)
    {
        Span<char> buffer = stackalloc char[32];
        int pos = buffer.Length;
        if (value == 0) buffer[--pos] = '0';
        while (value > 0)
        {
            buffer[--pos] = (char)('0' + (value & 1));
            value >>= 1;
        }
        return new string(buffer[pos..]);
    }

    static int SumSquares(int n)
    {
        Span<int> squares = stackalloc int[n];
        for (int i = 0; i < n; i++) squares[i] = i * i;
        int total = 0;
        foreach (int s in squares) total += s;
        return total;
    }

    static void Main()
    {
        Console.WriteLine(ToBinary(37));
        Console.WriteLine(ToBinary(0));
        Console.WriteLine(SumSquares(10));
        Span<byte> bytes = stackalloc byte[] { 1, 2, 3, 4 };
        bytes.Reverse();
        Console.WriteLine(string.Join(",", bytes.ToArray()));
    }
}
