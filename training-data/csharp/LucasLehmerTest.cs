using System;
using System.Collections.Generic;

public static class LucasLehmerTest
{
    public static bool IsMersennePrime(int p)
    {
        if (p == 2) return true;
        long m = (1L << p) - 1;
        long s = 4;
        for (int i = 0; i < p - 2; i++)
            s = (s * s - 2) % m;
        return s == 0;
    }

    public static void Main()
    {
        var result = new List<int>();
        foreach (int p in new[] { 2, 3, 5, 7, 11, 13, 17, 19 })
            if (IsMersennePrime(p)) result.Add(p);
        Console.WriteLine(string.Join(" ", result));
    }
}
