using System;

class Program
{
    static void Main()
    {
        Span<int> buf = stackalloc int[5];
        for (int i = 0; i < buf.Length; i++) buf[i] = i + 1;
        int sum = 0;
        foreach (var v in buf.Slice(1, 3)) sum += v;
        Console.WriteLine(sum);
    }
}
