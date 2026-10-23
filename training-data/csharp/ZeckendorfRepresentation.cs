using System;
using System.Collections.Generic;

public static class ZeckendorfRepresentation
{
    public static List<long> Zeckendorf(long n)
    {
        var fibs = new List<long> { 1, 2 };
        while (fibs[^1] <= n)
            fibs.Add(fibs[^1] + fibs[^2]);

        var parts = new List<long>();
        for (int i = fibs.Count - 1; i >= 0; i--)
        {
            if (fibs[i] <= n)
            {
                parts.Add(fibs[i]);
                n -= fibs[i];
            }
        }
        return parts;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Zeckendorf(100)));
    }
}
