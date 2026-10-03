using System;
using System.Collections.Generic;

class WordBreakDemo
{
    static bool CanSegment(string s, HashSet<string> dictionary)
    {
        var dp = new bool[s.Length + 1];
        dp[0] = true;

        for (int i = 1; i <= s.Length; i++)
        {
            for (int j = 0; j < i; j++)
            {
                if (dp[j] && dictionary.Contains(s.Substring(j, i - j)))
                {
                    dp[i] = true;
                    break;
                }
            }
        }

        return dp[s.Length];
    }

    static void Main()
    {
        var dict = new HashSet<string> { "leet", "code" };
        Console.WriteLine(CanSegment("leetcode", dict));
        Console.WriteLine(CanSegment("leetcodex", dict));
    }
}
