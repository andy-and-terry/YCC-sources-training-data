using System;
using System.Collections.Generic;

class PancakeSort
{
    static List<int> Sort(int[] a)
    {
        var flips = new List<int>();
        for (int size = a.Length; size > 1; size--)
        {
            int maxIdx = 0;
            for (int i = 1; i < size; i++)
                if (a[i] > a[maxIdx]) maxIdx = i;
            if (maxIdx == size - 1) continue;
            if (maxIdx > 0)
            {
                Array.Reverse(a, 0, maxIdx + 1);
                flips.Add(maxIdx + 1);
            }
            Array.Reverse(a, 0, size);
            flips.Add(size);
        }
        return flips;
    }

    static void Main()
    {
        int[] a = { 23, 10, 20, 11, 12, 6, 7 };
        var flips = Sort(a);
        Console.WriteLine($"{string.Join(" ", a)} | flips: {string.Join(",", flips)}");
    }
}
