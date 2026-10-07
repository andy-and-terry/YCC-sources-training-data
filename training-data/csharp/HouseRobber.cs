using System;
using System.Collections.Generic;

class HouseRobber
{
    static (int Total, List<int> Houses) Rob(int[] v)
    {
        int n = v.Length;
        var best = new int[n + 2];
        for (int i = n - 1; i >= 0; i--) best[i] = Math.Max(best[i + 1], v[i] + best[i + 2]);
        var houses = new List<int>();
        for (int i = 0; i < n;)
        {
            if (v[i] + best[i + 2] >= best[i + 1])
            {
                houses.Add(i);
                i += 2;
            }
            else i++;
        }
        return (best[0], houses);
    }

    static void Main()
    {
        foreach (var street in new[] { new[] { 2, 7, 9, 3, 1 }, new[] { 5, 1, 1, 5 } })
        {
            var (total, houses) = Rob(street);
            Console.WriteLine($"{total} from houses {string.Join(",", houses)}");
        }
    }
}
