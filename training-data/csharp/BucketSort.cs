using System;
using System.Collections.Generic;
using System.Linq;

class BucketSort
{
    static List<double> Sort(List<double> items, int bucketCount)
    {
        if (items.Count == 0) return items;
        double lo = items.Min(), hi = items.Max();
        double span = (hi - lo == 0) ? 1 : hi - lo;
        var buckets = new List<double>[bucketCount];
        for (int i = 0; i < bucketCount; i++) buckets[i] = new List<double>();
        foreach (double x in items)
        {
            int idx = Math.Min(bucketCount - 1, (int)((x - lo) / span * bucketCount));
            buckets[idx].Add(x);
        }
        var result = new List<double>();
        foreach (var bucket in buckets)
        {
            bucket.Sort();
            result.AddRange(bucket);
        }
        return result;
    }

    static void Main()
    {
        var data = new List<double> { 0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51 };
        Console.WriteLine(string.Join(" ", Sort(data, 10)));
    }
}
