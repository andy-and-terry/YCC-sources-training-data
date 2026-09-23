using System;
using System.Collections.Generic;

class WordBreakDemo
{
    static bool CanBreak(string s, HashSet<string> dict)
    {
        int n = s.Length;
        var dp = new bool[n + 1];
        dp[0] = true;
        for (int i = 1; i <= n; i++)
        {
            for (int j = 0; j < i; j++)
            {
                if (dp[j] && dict.Contains(s.Substring(j, i - j)))
                {
                    dp[i] = true;
                    break;
                }
            }
        }
        return dp[n];
    }

    static void Main()
    {
        var dict = new HashSet<string> { "leet", "code", "sand", "and", "cats", "dog" };
        Console.WriteLine(CanBreak("leetcode", dict));
        Console.WriteLine(CanBreak("catsandog", dict));
    }
}
