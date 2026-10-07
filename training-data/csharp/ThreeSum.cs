using System;
using System.Collections.Generic;
using System.Linq;

class ThreeSum
{
    static List<(int, int, int)> Find(int[] nums, int target = 0)
    {
        var a = nums.OrderBy(x => x).ToArray();
        var res = new List<(int, int, int)>();
        for (int i = 0; i < a.Length - 2; i++)
        {
            if (i > 0 && a[i] == a[i - 1]) continue;
            int lo = i + 1, hi = a.Length - 1;
            while (lo < hi)
            {
                int s = a[i] + a[lo] + a[hi];
                if (s < target) lo++;
                else if (s > target) hi--;
                else
                {
                    res.Add((a[i], a[lo], a[hi]));
                    while (lo < hi && a[lo] == a[lo + 1]) lo++;
                    while (lo < hi && a[hi] == a[hi - 1]) hi--;
                    lo++;
                    hi--;
                }
            }
        }
        return res;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Find(new[] { -1, 0, 1, 2, -1, -4 })));
        Console.WriteLine(string.Join(" ", Find(new[] { 1, 2, 3, 4, 5, 6 }, 10)));
    }
}
