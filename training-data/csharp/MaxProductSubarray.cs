using System;
using System.Linq;

class MaxProductSubarray
{
    static long MaxProduct(int[] a)
    {
        long best = a[0], hi = a[0], lo = a[0];
        foreach (long x in a.Skip(1))
        {
            if (x < 0) (hi, lo) = (lo, hi);
            hi = Math.Max(x, hi * x);
            lo = Math.Min(x, lo * x);
            best = Math.Max(best, hi);
        }
        return best;
    }

    static void Main()
    {
        foreach (var a in new[] { new[] { 2, 3, -2, 4 }, new[] { -2, 0, -1 }, new[] { -2, 3, -4 }, new[] { 1, -2, -3, 0, 7, -8, -2 } })
            Console.WriteLine($"[{string.Join(",", a)}] -> {MaxProduct(a)}");
    }
}
