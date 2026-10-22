using System;
using System.Collections.Generic;
using System.Linq;

public static class KolakoskiSequence
{
    public static List<int> Kolakoski(int count)
    {
        var seq = new List<int> { 1, 2, 2 };
        for (int i = 2; seq.Count < count; i++)
        {
            int value = 3 - seq[seq.Count - 1];
            for (int k = 0; k < seq[i]; k++)
                seq.Add(value);
        }
        return seq.Take(count).ToList();
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Kolakoski(20)));
    }
}
