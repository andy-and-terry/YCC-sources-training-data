using System;

class SpanMemoryDemo
{
    static int SumSpan(ReadOnlySpan<int> span)
    {
        int sum = 0;
        foreach (int x in span) sum += x;
        return sum;
    }

    static void Main()
    {
        int[] data = { 1, 2, 3, 4, 5, 6, 7, 8 };
        Span<int> span = data;
        Console.WriteLine(SumSpan(span));
        Console.WriteLine(SumSpan(span.Slice(2, 3)));
    }
}
