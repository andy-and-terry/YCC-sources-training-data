using System;
using System.Collections.Generic;

public static class RecamanSequence
{
    public static List<int> Recaman(int count)
    {
        var seq = new List<int> { 0 };
        var seen = new HashSet<int> { 0 };
        for (int n = 1; n < count; n++)
        {
            int next = seq[n - 1] - n;
            if (next <= 0 || seen.Contains(next))
                next = seq[n - 1] + n;
            seen.Add(next);
            seq.Add(next);
        }
        return seq;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Recaman(20)));
    }
}
