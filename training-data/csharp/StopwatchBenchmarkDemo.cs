using System;
using System.Diagnostics;
using System.Linq;

class StopwatchBenchmarkDemo
{
    static long Measure(string name, Action action, int iterations = 5)
    {
        action();
        var sw = Stopwatch.StartNew();
        for (int i = 0; i < iterations; i++) action();
        sw.Stop();
        Console.WriteLine($"{name}: avg {sw.ElapsedMilliseconds / (double)iterations:F2} ms");
        return sw.ElapsedMilliseconds;
    }

    static void Main()
    {
        var data = Enumerable.Range(0, 200_000).ToArray();
        Measure("LINQ sum", () => data.Sum(x => (long)x));
        Measure("loop sum", () =>
        {
            long s = 0;
            foreach (var x in data) s += x;
        });
        Console.WriteLine($"High resolution: {Stopwatch.IsHighResolution}");
    }
}
