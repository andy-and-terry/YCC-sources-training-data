using System;
using System.Linq;

class ShoelaceArea
{
    static double Area((double X, double Y)[] p) =>
        Math.Abs(p.Select((a, i) => { var b = p[(i + 1) % p.Length]; return a.X * b.Y - b.X * a.Y; }).Sum()) / 2;

    static void Main() => Console.WriteLine(Area(new[] { (0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0) }));
}
