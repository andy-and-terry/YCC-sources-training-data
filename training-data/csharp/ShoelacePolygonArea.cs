using System;

// Shoelace polygon area with a readonly record struct.
readonly record struct Point(double X, double Y);

class ShoelacePolygonArea {
    static double Area(Point[] p) {
        double s = 0;
        for (int i = 0; i < p.Length; i++) {
            var q = p[(i + 1) % p.Length];
            s += p[i].X * q.Y - q.X * p[i].Y;
        }
        return Math.Abs(s) / 2;
    }
    static void Main() => Console.WriteLine(Area(new[] { new Point(0, 0), new Point(4, 0), new Point(4, 3), new Point(0, 3) }));
}
