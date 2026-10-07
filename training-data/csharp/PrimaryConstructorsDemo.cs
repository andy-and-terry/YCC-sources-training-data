using System;

class Point(double x, double y)
{
    public double X { get; } = x;
    public double Y { get; } = y;

    public double DistanceTo(Point other)
    {
        double dx = X - other.X, dy = Y - other.Y;
        return Math.Sqrt(dx * dx + dy * dy);
    }

    public override string ToString() => $"({X}, {Y})";
}

class Circle(Point center, double radius) : Shape(center)
{
    public double Radius { get; } = radius;
    public override double Area => Math.PI * Radius * Radius;
}

abstract class Shape(Point center)
{
    public Point Center { get; } = center;
    public abstract double Area { get; }
}

class PrimaryConstructorsDemo
{
    static void Main()
    {
        var p1 = new Point(0, 0);
        var p2 = new Point(3, 4);
        Console.WriteLine($"{p1} to {p2} = {p1.DistanceTo(p2)}");

        var circle = new Circle(p1, 2.0);
        Console.WriteLine($"circle area: {circle.Area:F2}");
    }
}
