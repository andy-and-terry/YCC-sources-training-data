using System;
using System.Collections.Generic;
using System.Linq;

class IntersectionOfArrays
{
    static List<int> Multiset(int[] a, int[] b)
    {
        var counts = a.GroupBy(x => x).ToDictionary(g => g.Key, g => g.Count());
        var result = new List<int>();
        foreach (int x in b)
        {
            if (counts.TryGetValue(x, out int c) && c > 0)
            {
                result.Add(x);
                counts[x] = c - 1;
            }
        }
        return result;
    }

    static void Main()
    {
        int[] a = { 4, 9, 5, 4, 4 }, b = { 9, 4, 9, 8, 4 };
        Console.WriteLine(string.Join(" ", a.Intersect(b).OrderBy(x => x)));
        Console.WriteLine(string.Join(" ", Multiset(a, b)));
        var set = new HashSet<int>(a);
        set.SymmetricExceptWith(b);
        Console.WriteLine($"symmetric difference: {string.Join(" ", set.OrderBy(x => x))}");
    }
}
