using System;

class ShoelacePolygonArea
{
    static double Area((double X, double Y)[] p)
    {
        double s = 0;
        for (int i = 0; i < p.Length; i++)
        {
            var (a, b) = (p[i], p[(i + 1) % p.Length]);
            s += a.X * b.Y - b.X * a.Y;
        }
        return Math.Abs(s) / 2;
    }

    static void Main() => Console.WriteLine(Area(new[] { (0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0) }));
}
