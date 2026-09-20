using System;
using System.Collections.Generic;

class ZAlgorithmDemo
{
    static int[] BuildZArray(string s)
    {
        int n = s.Length;
        var z = new int[n];
        int left = 0, right = 0;

        for (int i = 1; i < n; i++)
        {
            if (i < right) z[i] = Math.Min(right - i, z[i - left]);
            while (i + z[i] < n && s[z[i]] == s[i + z[i]]) z[i]++;
            if (i + z[i] > right)
            {
                left = i;
                right = i + z[i];
            }
        }

        return z;
    }

    static List<int> Search(string text, string pattern)
    {
        var combined = pattern + "\x01" + text;
        var z = BuildZArray(combined);
        var matches = new List<int>();

        for (int i = 0; i < z.Length; i++)
        {
            if (z[i] == pattern.Length) matches.Add(i - pattern.Length - 1);
        }

        return matches;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Search("ababcababcabc", "abcab")));
        Console.WriteLine(string.Join(" ", Search("aaaaa", "aa")));
    }
}
