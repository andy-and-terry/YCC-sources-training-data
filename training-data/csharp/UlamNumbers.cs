using System;
using System.Collections.Generic;
using System.Linq;

public static class UlamNumbers
{
    public static List<int> Ulam(int count)
    {
        var seq = new List<int> { 1, 2 };
        for (int n = 3; seq.Count < count; n++)
        {
            int candidate = n;
            int ways = seq.Count(a => candidate - a > a && seq.Contains(candidate - a));
            if (ways == 1)
                seq.Add(n);
        }
        return seq;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Ulam(15)));
    }
}
