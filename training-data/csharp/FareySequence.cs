using System;
using System.Collections.Generic;

public static class FareySequence
{
    public static List<string> Farey(int n)
    {
        var terms = new List<string> { "0/1" };
        int a = 0, b = 1, c = 1, d = n;
        while (c <= n)
        {
            terms.Add($"{c}/{d}");
            int k = (n + b) / d;
            (a, b, c, d) = (c, d, k * c - a, k * d - b);
        }
        return terms;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Farey(5)));
    }
}
