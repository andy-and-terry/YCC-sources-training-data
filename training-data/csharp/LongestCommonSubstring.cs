using System;

class LongestCommonSubstring
{
    static string Find(string a, string b)
    {
        var dp = new int[a.Length + 1, b.Length + 1];
        int maxLen = 0, endIndex = 0;

        for (int i = 1; i <= a.Length; i++)
        {
            for (int j = 1; j <= b.Length; j++)
            {
                if (a[i - 1] == b[j - 1])
                {
                    dp[i, j] = dp[i - 1, j - 1] + 1;
                    if (dp[i, j] > maxLen)
                    {
                        maxLen = dp[i, j];
                        endIndex = i;
                    }
                }
            }
        }

        return a.Substring(endIndex - maxLen, maxLen);
    }

    static void Main()
    {
        Console.WriteLine(Find("abcdefg", "xyzabcq"));
        Console.WriteLine(Find("programming", "gaming"));
    }
}
