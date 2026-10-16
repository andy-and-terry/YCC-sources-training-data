using System;
using System.Collections.Generic;

class EqualsHashCodeDemo
{
    class Point
    {
        public int X { get; }
        public int Y { get; }
        public Point(int x, int y) { X = x; Y = y; }
        public override bool Equals(object? obj) => obj is Point p && p.X == X && p.Y == Y;
        public override int GetHashCode() => HashCode.Combine(X, Y);
        public override string ToString() => $"({X},{Y})";
    }

    class BadPoint
    {
        public int X { get; }
        public BadPoint(int x) => X = x;
        public override bool Equals(object? obj) => obj is BadPoint p && p.X == X;
    }

    static void Main()
    {
        var a = new Point(1, 2);
        var b = new Point(1, 2);
        Console.WriteLine(a == b);
        Console.WriteLine(a.Equals(b));
        Console.WriteLine(a.GetHashCode() == b.GetHashCode());

        var set = new HashSet<Point> { a, b, new Point(3, 4) };
        Console.WriteLine(set.Count);

        var bad = new HashSet<BadPoint> { new BadPoint(1) };
        Console.WriteLine("bad contains equal item: " + bad.Contains(new BadPoint(1)));
    }
}
