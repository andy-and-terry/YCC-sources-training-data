using System;
using System.Collections.Generic;

class RabinKarpSearch
{
    const int Base = 256;
    const int Mod = 1_000_000_007;

    static List<int> Search(string text, string pattern)
    {
        var matches = new List<int>();
        int n = text.Length, m = pattern.Length;
        if (m == 0 || m > n) return matches;

        long patternHash = 0, windowHash = 0, highOrder = 1;
        for (int i = 0; i < m - 1; i++) highOrder = (highOrder * Base) % Mod;

        for (int i = 0; i < m; i++)
        {
            patternHash = (patternHash * Base + pattern[i]) % Mod;
            windowHash = (windowHash * Base + text[i]) % Mod;
        }

        for (int i = 0; i <= n - m; i++)
        {
            if (windowHash == patternHash && text.Substring(i, m) == pattern)
                matches.Add(i);

            if (i < n - m)
            {
                windowHash = (windowHash - text[i] * highOrder % Mod + Mod) % Mod;
                windowHash = (windowHash * Base + text[i + m]) % Mod;
            }
        }

        return matches;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Search("abxabcabcaby", "abcaby")));
        Console.WriteLine(string.Join(" ", Search("aaaaa", "aa")));
    }
}
