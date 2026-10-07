using System;
using System.Collections.Generic;

class LongestSubstringNoRepeat
{
    static string Longest(string s)
    {
        var last = new Dictionary<char, int>();
        int start = 0, bestStart = 0, bestLen = 0;
        for (int i = 0; i < s.Length; i++)
        {
            if (last.TryGetValue(s[i], out int p) && p >= start) start = p + 1;
            last[s[i]] = i;
            if (i - start + 1 > bestLen) (bestStart, bestLen) = (start, i - start + 1);
        }
        return s.Substring(bestStart, bestLen);
    }

    static void Main()
    {
        foreach (var s in new[] { "abcabcbb", "bbbbb", "pwwkew", "dvdf" })
        {
            string r = Longest(s);
            Console.WriteLine($"{s} {r} {r.Length}");
        }
    }
}
