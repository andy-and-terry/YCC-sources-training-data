using System;
using System.Collections.Generic;

class Point : IEquatable<Point>
{
    public int X { get; }
    public int Y { get; }

    public Point(int x, int y) { X = x; Y = y; }

    public bool Equals(Point? other) => other is not null && X == other.X && Y == other.Y;
    public override bool Equals(object? obj) => Equals(obj as Point);
    public override int GetHashCode() => HashCode.Combine(X, Y);
    public override string ToString() => $"({X}, {Y})";
}

class StructuralEqualityDemo
{
    static void Main()
    {
        var a = new Point(1, 2);
        var b = new Point(1, 2);
        Console.WriteLine(a == b);
        Console.WriteLine(a.Equals(b));
        Console.WriteLine(a.GetHashCode() == b.GetHashCode());

        var set = new HashSet<Point> { a, b, new Point(3, 4) };
        Console.WriteLine(set.Count);
        Console.WriteLine(set.Contains(new Point(3, 4)));
    }
}
