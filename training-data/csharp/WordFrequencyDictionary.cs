using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

class WordFrequencyDictionary
{
    static void Main()
    {
        string text = "The quick brown fox jumps over the lazy dog. The dog sleeps; the fox runs.";
        var counts = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);

        foreach (Match m in Regex.Matches(text, @"[A-Za-z']+"))
        {
            counts.TryGetValue(m.Value, out int n);
            counts[m.Value] = n + 1;
        }

        foreach (var kv in counts.OrderByDescending(k => k.Value).ThenBy(k => k.Key).Take(4))
            Console.WriteLine($"{kv.Key,-6}{kv.Value}");

        Console.WriteLine(counts.Count);
        Console.WriteLine(counts.GetValueOrDefault("cat", 0));
    }
}
