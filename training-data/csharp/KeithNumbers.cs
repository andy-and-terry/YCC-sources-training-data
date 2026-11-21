using System;
using System.Collections.Generic;
using System.Linq;

// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
class KeithNumbers
{
    static bool IsKeith(int n)
    {
        var seq = n.ToString().Select(c => c - '0').ToList();
        int k = seq.Count;
        while (seq[^1] < n) seq.Add(seq.Skip(seq.Count - k).Sum());
        return seq[^1] == n;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(10, 1190).Where(IsKeith)));
    }
}
