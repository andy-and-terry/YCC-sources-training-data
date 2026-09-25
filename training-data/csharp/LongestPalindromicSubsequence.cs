using System;

class LongestPalindromicSubsequence
{
    static int Lps(string s)
    {
        int n = s.Length;
        if (n == 0) return 0;
        var dp = new int[n];
        for (int i = n - 1; i >= 0; i--)
        {
            dp[i] = 1;
            int prev = 0;
            for (int j = i + 1; j < n; j++)
            {
                int tmp = dp[j];
                dp[j] = s[i] == s[j] ? prev + 2 : Math.Max(dp[j], dp[j - 1]);
                prev = tmp;
            }
        }
        return dp[n - 1];
    }

    static void Main()
    {
        foreach (var s in new[] { "bbbab", "character", "agbdba", "racecar", "cbbd" })
            Console.WriteLine($"{s} {Lps(s)} (insertions to palindrome: {s.Length - Lps(s)})");
    }
}
