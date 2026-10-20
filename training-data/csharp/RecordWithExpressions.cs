using System;

record Point(int X, int Y)
{
    public double Length => Math.Sqrt(X * X + Y * Y);
}

class Program
{
    static void Main()
    {
        var p = new Point(3, 4);
        var q = p with { Y = 0 };
        Console.WriteLine($"{p} {p.Length} {q} {p == new Point(3, 4)}");
    }
}
