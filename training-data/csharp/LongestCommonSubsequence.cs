using System;

class LongestCommonSubsequence
{
    static string Lcs(string a, string b)
    {
        int m = a.Length, n = b.Length;
        var dp = new string[m + 1, n + 1];
        for (int i = 0; i <= m; i++) dp[i, 0] = "";
        for (int j = 0; j <= n; j++) dp[0, j] = "";
        for (int i = 1; i <= m; i++)
        {
            for (int j = 1; j <= n; j++)
            {
                if (a[i - 1] == b[j - 1]) dp[i, j] = dp[i - 1, j - 1] + a[i - 1];
                else dp[i, j] = dp[i - 1, j].Length >= dp[i, j - 1].Length ? dp[i - 1, j] : dp[i, j - 1];
            }
        }
        return dp[m, n];
    }

    static void Main()
    {
        Console.WriteLine(Lcs("ABCBDAB", "BDCABA"));
    }
}
