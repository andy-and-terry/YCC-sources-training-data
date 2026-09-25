using System;
using System.Linq;

public enum TriangleKind { Equilateral, Isosceles, Scalene, Invalid }

public static class TriangleClassify
{
    public static TriangleKind Classify(double a, double b, double c)
    {
        var s = new[] { a, b, c }.OrderBy(x => x).ToArray();
        if (s[0] <= 0 || s[0] + s[1] <= s[2]) return TriangleKind.Invalid;
        return new[] { a, b, c }.Distinct().Count() switch
        {
            1 => TriangleKind.Equilateral,
            2 => TriangleKind.Isosceles,
            _ => TriangleKind.Scalene,
        };
    }

    public static void Main()
    {
        Console.WriteLine($"{Classify(3, 3, 3)} {Classify(3, 4, 4)} {Classify(3, 4, 5)} {Classify(1, 1, 3)}");
    }
}
