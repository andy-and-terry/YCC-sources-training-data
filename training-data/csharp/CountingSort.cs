using System;
using System.Collections.Generic;
using System.Linq;

class CountingSort
{
    static int[] Sort(int[] items)
    {
        if (items.Length == 0) return items;
        int max = items.Max();
        var counts = new int[max + 1];
        foreach (int x in items) counts[x]++;
        var result = new List<int>();
        for (int value = 0; value <= max; value++)
            for (int c = 0; c < counts[value]; c++) result.Add(value);
        return result.ToArray();
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sort(new[] { 5, 3, 8, 1, 9, 2, 3 })));
    }
}
