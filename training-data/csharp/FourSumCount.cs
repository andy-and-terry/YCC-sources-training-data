using System;
using System.Collections.Generic;

class FourSumCount
{
    static int Count(int[] a, int[] b, int[] c, int[] d)
    {
        var sums = new Dictionary<int, int>();
        foreach (var x in a)
            foreach (var y in b)
                sums[x + y] = sums.GetValueOrDefault(x + y) + 1;
        int total = 0;
        foreach (var x in c)
            foreach (var y in d)
                total += sums.GetValueOrDefault(-(x + y));
        return total;
    }

    static void Main() =>
        Console.WriteLine(Count(new[] { 1, 2 }, new[] { -2, -1 }, new[] { -1, 2 }, new[] { 0, 2 })); // 2
}
