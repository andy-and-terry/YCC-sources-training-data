using System;

class TuplesDeconstructionLocalFunctions
{
    static (int Min, int Max, double Avg) Stats(int[] xs)
    {
        int min = xs[0], max = xs[0], sum = 0;
        foreach (var x in xs) { if (x < min) min = x; if (x > max) max = x; sum += x; }
        return (min, max, (double)sum / xs.Length);
    }

    class P { public int X, Y; public void Deconstruct(out int x, out int y) { x = X; y = Y; } }

    static void Main()
    {
        var (lo, hi, avg) = Stats(new[] { 4, 8, 1, 9 });
        Console.WriteLine($"{lo} {hi} {avg}");
        var (x, y) = new P { X = 3, Y = 4 };
        int Fact(int n) => n <= 1 ? 1 : n * Fact(n - 1);
        Console.WriteLine(x + y + " " + Fact(5));
        (x, y) = (y, x);
        Console.WriteLine($"{x}{y}");
    }
}
