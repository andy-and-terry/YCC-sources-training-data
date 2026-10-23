using System;
using System.Collections.Generic;

public static class UlamNumbers
{
    public static List<int> Ulam(int count)
    {
        var seq = new List<int> { 1, 2 };
        for (int candidate = 3; seq.Count < count; candidate++)
        {
            int ways = 0;
            for (int i = 0; i < seq.Count; i++)
                for (int j = i + 1; j < seq.Count; j++)
                    if (seq[i] + seq[j] == candidate)
                        ways++;
            if (ways == 1)
                seq.Add(candidate);
        }
        return seq;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Ulam(15)));
    }
}
