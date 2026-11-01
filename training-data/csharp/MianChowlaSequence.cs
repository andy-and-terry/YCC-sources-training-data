using System;
using System.Collections.Generic;

// Greedy sequence whose pairwise sums are all distinct.
class MianChowlaSequence
{
    static void Main()
    {
        var seq = new List<int>();
        var sums = new HashSet<int>();
        for (int cand = 1; seq.Count < 8; cand++)
        {
            var fresh = new HashSet<int>();
            bool ok = true;
            var all = new List<int>(seq) { cand };
            foreach (int x in all)
            {
                int s = x + cand;
                if (sums.Contains(s) || !fresh.Add(s)) { ok = false; break; }
            }
            if (ok) { seq.Add(cand); sums.UnionWith(fresh); }
        }
        Console.WriteLine(string.Join(" ", seq));
    }
}
