using System;
using System.Collections.Generic;
using System.Linq;

class KMeansClusteringDemo
{
    record Point(double X, double Y);

    static double Distance(Point a, Point b) => Math.Sqrt(Math.Pow(a.X - b.X, 2) + Math.Pow(a.Y - b.Y, 2));

    static List<Point> KMeans(List<Point> points, int k, int iterations)
    {
        var centroids = points.Take(k).ToList();

        for (int iter = 0; iter < iterations; iter++)
        {
            var clusters = new List<Point>[k];
            for (int i = 0; i < k; i++) clusters[i] = new List<Point>();

            foreach (var p in points)
            {
                int closest = 0;
                double minDist = double.MaxValue;
                for (int i = 0; i < k; i++)
                {
                    double d = Distance(p, centroids[i]);
                    if (d < minDist) { minDist = d; closest = i; }
                }
                clusters[closest].Add(p);
            }

            for (int i = 0; i < k; i++)
            {
                if (clusters[i].Count == 0) continue;
                centroids[i] = new Point(clusters[i].Average(p => p.X), clusters[i].Average(p => p.Y));
            }
        }
        return centroids;
    }

    static void Main()
    {
        var points = new List<Point>
        {
            new(1, 1), new(1.5, 2), new(3, 4), new(5, 7), new(3.5, 5), new(4.5, 5), new(3.5, 4.5)
        };
        foreach (var c in KMeans(points, 2, 20)) Console.WriteLine(c);
    }
}
