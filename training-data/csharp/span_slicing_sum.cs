using System;

class SpanSlicingSum
{
    static int Sum(ReadOnlySpan<int> xs)
    {
        int total = 0;
        foreach (var x in xs) total += x;
        return total;
    }

    static void Main()
    {
        int[] data = { 1, 2, 3, 4, 5, 6 };
        Console.WriteLine(Sum(data.AsSpan(1, 3)));
        Console.WriteLine(Sum(data));
    }
}
