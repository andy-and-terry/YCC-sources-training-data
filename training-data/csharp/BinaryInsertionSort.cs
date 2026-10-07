using System;
using System.Collections.Generic;

class BinaryInsertionSort
{
    static List<int> Sort(IEnumerable<int> items)
    {
        var sorted = new List<int>();
        foreach (int x in items)
        {
            int idx = sorted.BinarySearch(x);
            if (idx < 0) idx = ~idx;
            else while (idx < sorted.Count && sorted[idx] == x) idx++; // keep stable
            sorted.Insert(idx, x);
        }
        return sorted;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sort(new[] { 37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54, 23 })));
    }
}
