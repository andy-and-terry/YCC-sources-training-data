using System;

readonly struct Point
{
    public double X { get; }
    public double Y { get; }

    public Point(double x, double y)
    {
        X = x;
        Y = y;
    }

    public Point Translate(double dx, double dy) => new(X + dx, Y + dy);

    public static double Distance(in Point a, in Point b)
    {
        double dx = a.X - b.X;
        double dy = a.Y - b.Y;
        return Math.Sqrt(dx * dx + dy * dy);
    }
}

class ReadonlyStructDemo
{
    static void Main()
    {
        var p1 = new Point(0, 0);
        var p2 = p1.Translate(3, 4);
        Console.WriteLine(Point.Distance(in p1, in p2));
    }
}
