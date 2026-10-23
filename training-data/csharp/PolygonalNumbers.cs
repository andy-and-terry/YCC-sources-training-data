using System;
using System.Linq;

public static class PolygonalNumbers
{
    public static int Polygonal(int sides, int n) =>
        ((sides - 2) * n * n - (sides - 4) * n) / 2;

    public static void Main()
    {
        var shapes = new (string Name, int Sides)[] { ("Triangular", 3), ("Pentagonal", 5), ("Hexagonal", 6) };
        foreach (var (name, sides) in shapes)
        {
            var nums = Enumerable.Range(1, 10).Select(n => Polygonal(sides, n));
            Console.WriteLine($"{name}: {string.Join(" ", nums)}");
        }
    }
}
