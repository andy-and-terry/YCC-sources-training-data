using System;

class TriangleMinPath
{
    static int MinimumTotal(int[][] t)
    {
        var dp = (int[])t[^1].Clone();
        for (int r = t.Length - 2; r >= 0; r--)
            for (int i = 0; i < t[r].Length; i++)
                dp[i] = t[r][i] + Math.Min(dp[i], dp[i + 1]);
        return dp[0];
    }

    static void Main() =>
        Console.WriteLine(MinimumTotal(new[] { new[] { 2 }, new[] { 3, 4 }, new[] { 6, 5, 7 }, new[] { 4, 1, 8, 3 } })); // 11
}
