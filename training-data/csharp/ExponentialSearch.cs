using System;
using System.Linq;

class ExponentialSearch
{
    static int Search(int[] a, int target)
    {
        if (a.Length == 0) return -1;
        int bound = 1;
        while (bound < a.Length && a[bound] < target) bound *= 2;
        int lo = bound / 2, hi = Math.Min(bound, a.Length - 1);
        int idx = Array.BinarySearch(a, lo, hi - lo + 1, target);
        return idx >= 0 ? idx : -1;
    }

    static void Main()
    {
        int[] a = Enumerable.Range(0, 67).Select(i => i * 3).ToArray();
        Console.WriteLine($"{Search(a, 99)} {Search(a, 100)} {Search(a, 0)}");
    }
}
