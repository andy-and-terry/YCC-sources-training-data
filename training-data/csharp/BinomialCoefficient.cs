using System;

class BinomialCoefficient
{
    static long NCr(int n, int r)
    {
        if (r < 0 || r > n) return 0;
        var dp = new long[n + 1, r + 1];
        for (int i = 0; i <= n; i++)
        {
            for (int j = 0; j <= Math.Min(i, r); j++)
            {
                if (j == 0 || j == i) dp[i, j] = 1;
                else dp[i, j] = dp[i - 1, j - 1] + dp[i - 1, j];
            }
        }
        return dp[n, r];
    }

    static void Main()
    {
        Console.WriteLine(NCr(5, 2));
        Console.WriteLine(NCr(10, 3));
    }
}
