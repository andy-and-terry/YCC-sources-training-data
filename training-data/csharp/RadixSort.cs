using System;
using System.Collections.Generic;
using System.Linq;

class RadixSort
{
    static int[] Sort(int[] items)
    {
        if (items.Length == 0) return items;
        var arr = (int[])items.Clone();
        int max = arr.Max();
        for (int exp = 1; max / exp > 0; exp *= 10)
        {
            var buckets = new List<int>[10];
            for (int i = 0; i < 10; i++) buckets[i] = new List<int>();
            foreach (int x in arr) buckets[(x / exp) % 10].Add(x);
            arr = buckets.SelectMany(b => b).ToArray();
        }
        return arr;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sort(new[] { 170, 45, 75, 90, 802, 24, 2, 66 })));
    }
}
