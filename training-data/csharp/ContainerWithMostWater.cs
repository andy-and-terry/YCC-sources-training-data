using System;

class ContainerWithMostWater
{
    static (int Area, int Left, int Right) MaxArea(int[] h)
    {
        int lo = 0, hi = h.Length - 1;
        var best = (Area: 0, Left: 0, Right: 0);
        while (lo < hi)
        {
            int area = (hi - lo) * Math.Min(h[lo], h[hi]);
            if (area > best.Area) best = (area, lo, hi);
            if (h[lo] < h[hi]) lo++;
            else hi--;
        }
        return best;
    }

    static void Main() => Console.WriteLine(MaxArea(new[] { 1, 8, 6, 2, 5, 4, 8, 3, 7 }));
}
