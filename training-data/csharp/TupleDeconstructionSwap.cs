using System;

public static class TupleDeconstructionSwap
{
    static (int Min, int Max) MinMax(int[] values)
    {
        int min = values[0], max = values[0];
        foreach (var v in values)
        {
            if (v < min) min = v;
            if (v > max) max = v;
        }
        return (min, max);
    }

    public static void Main()
    {
        int a = 3, b = 8;
        (a, b) = (b, a);
        Console.WriteLine($"a={a} b={b}");

        var (lo, hi) = MinMax(new[] { 4, 9, 1, 7 });
        Console.WriteLine($"min={lo} max={hi}");
    }
}
