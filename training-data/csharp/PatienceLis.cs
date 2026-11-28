using System;
using System.Collections.Generic;

class PatienceLis
{
    static void Main()
    {
        int[] a = { 10, 9, 2, 5, 3, 7, 101, 18 };
        var tails = new List<int>();
        foreach (int x in a)
        {
            int i = tails.BinarySearch(x);
            if (i < 0) i = ~i;
            if (i == tails.Count) tails.Add(x); else tails[i] = x;
        }
        Console.WriteLine(tails.Count);
    }
}
