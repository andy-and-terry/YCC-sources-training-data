using System;
using System.Collections.Generic;

// A custom IEqualityComparer lets a Dictionary or HashSet use
// a different notion of "same key" than the type's own Equals.
class CaseInsensitiveTrimComparer : IEqualityComparer<string>
{
    public bool Equals(string x, string y) =>
        string.Equals(x?.Trim(), y?.Trim(), StringComparison.OrdinalIgnoreCase);

    public int GetHashCode(string s) =>
        s.Trim().ToLowerInvariant().GetHashCode();
}

record Point(int X, int Y);

class ManhattanBucketComparer : IEqualityComparer<Point>
{
    public bool Equals(Point a, Point b) => Math.Abs(a.X) + Math.Abs(a.Y) == Math.Abs(b.X) + Math.Abs(b.Y);
    public int GetHashCode(Point p) => Math.Abs(p.X) + Math.Abs(p.Y);
}

class Program
{
    static void Main()
    {
        var counts = new Dictionary<string, int>(new CaseInsensitiveTrimComparer());
        foreach (var word in new[] { "Apple", " apple", "APPLE ", "Pear" })
        {
            counts[word] = counts.GetValueOrDefault(word) + 1;
        }
        foreach (var kv in counts)
            Console.WriteLine($"'{kv.Key}' -> {kv.Value}");

        var points = new HashSet<Point>(new ManhattanBucketComparer())
        {
            new Point(1, 2), new Point(-1, -2), new Point(3, 0), new Point(0, 3)
        };
        Console.WriteLine(points.Count);
    }
}
