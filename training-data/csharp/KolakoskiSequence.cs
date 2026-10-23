using System;
using System.Collections.Generic;

public static class KolakoskiSequence
{
    public static List<int> Kolakoski(int count)
    {
        var seq = new List<int> { 1, 2, 2 };
        for (int i = 2; seq.Count < count; i++)
        {
            int value = i % 2 == 0 ? 1 : 2;
            for (int k = 0; k < seq[i]; k++)
                seq.Add(value);
        }
        return seq.GetRange(0, count);
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Kolakoski(20)));
    }
}
