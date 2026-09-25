using System;
using System.Collections.Generic;

class BoyerMooreHorspool
{
    static List<int> Search(string text, string pattern)
    {
        var matches = new List<int>();
        int m = pattern.Length, n = text.Length;
        if (m == 0 || m > n) return matches;
        var shift = new Dictionary<char, int>();
        for (int i = 0; i < m - 1; i++) shift[pattern[i]] = m - 1 - i;
        for (int i = 0; i <= n - m; i += shift.GetValueOrDefault(text[i + m - 1], m))
            if (string.CompareOrdinal(text, i, pattern, 0, m) == 0) matches.Add(i);
        return matches;
    }

    static void Main()
    {
        string text = "here is a simple example, an example indeed";
        Console.WriteLine($"{string.Join(",", Search(text, "example"))} (IndexOf: {text.IndexOf("example", StringComparison.Ordinal)})");
    }
}
