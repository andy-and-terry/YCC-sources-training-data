using System;

class ContainerMostWater
{
    static int MaxArea(int[] h)
    {
        int lo = 0, hi = h.Length - 1, best = 0;
        while (lo < hi)
        {
            best = Math.Max(best, Math.Min(h[lo], h[hi]) * (hi - lo));
            if (h[lo] < h[hi]) lo++; else hi--;
        }
        return best;
    }

    static void Main() => Console.WriteLine(MaxArea(new[] { 1, 8, 6, 2, 5, 4, 8, 3, 7 })); // 49
}
