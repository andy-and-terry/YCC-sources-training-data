using System;
using System.Collections.Generic;

public static class VanEckSequence
{
    public static List<int> VanEck(int count)
    {
        var seq = new List<int> { 0 };
        var lastSeen = new Dictionary<int, int>();
        for (int n = 0; n < count - 1; n++)
        {
            int current = seq[n];
            int next = lastSeen.TryGetValue(current, out int previous) ? n - previous : 0;
            lastSeen[current] = n;
            seq.Add(next);
        }
        return seq;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", VanEck(20)));
    }
}
