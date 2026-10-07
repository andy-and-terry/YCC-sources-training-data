using System;
using System.Collections.Generic;
using System.Linq;

class MergeIntervals
{
    static List<(int, int)> Merge(List<(int, int)> intervals)
    {
        var sorted = intervals.OrderBy(i => i.Item1).ToList();
        var result = new List<(int, int)>();

        foreach (var interval in sorted)
        {
            if (result.Count == 0 || result[^1].Item2 < interval.Item1)
            {
                result.Add(interval);
            }
            else
            {
                var last = result[^1];
                result[^1] = (last.Item1, Math.Max(last.Item2, interval.Item2));
            }
        }

        return result;
    }

    static void Main()
    {
        var intervals = new List<(int, int)> { (1, 3), (2, 6), (8, 10), (15, 18) };
        foreach (var (start, end) in Merge(intervals))
            Console.WriteLine($"[{start}, {end}]");
    }
}
