using System;
using System.Collections.Generic;

class KmpSearch
{
    static int[] BuildLPS(string pattern)
    {
        var lps = new int[pattern.Length];
        int length = 0, i = 1;
        while (i < pattern.Length)
        {
            if (pattern[i] == pattern[length]) lps[i++] = ++length;
            else if (length != 0) length = lps[length - 1];
            else lps[i++] = 0;
        }
        return lps;
    }

    static List<int> Search(string text, string pattern)
    {
        var matches = new List<int>();
        if (pattern.Length == 0) return matches;
        var lps = BuildLPS(pattern);
        int i = 0, j = 0;
        while (i < text.Length)
        {
            if (text[i] == pattern[j])
            {
                i++; j++;
                if (j == pattern.Length)
                {
                    matches.Add(i - j);
                    j = lps[j - 1];
                }
            }
            else if (j != 0) j = lps[j - 1];
            else i++;
        }
        return matches;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Search("abxabcabcaby", "abcaby")));
    }
}
