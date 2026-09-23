using System;

class MatrixChainMultiplicationDemo
{
    static int MinCost(int[] dims)
    {
        int n = dims.Length - 1;
        var dp = new int[n + 1, n + 1];

        for (int len = 2; len <= n; len++)
        {
            for (int i = 1; i <= n - len + 1; i++)
            {
                int j = i + len - 1;
                dp[i, j] = int.MaxValue;
                for (int k = i; k < j; k++)
                {
                    int cost = dp[i, k] + dp[k + 1, j] + dims[i - 1] * dims[k] * dims[j];
                    if (cost < dp[i, j]) dp[i, j] = cost;
                }
            }
        }

        return dp[1, n];
    }

    static void Main()
    {
        int[] dims = { 30, 35, 15, 5, 10, 20 };
        Console.WriteLine(MinCost(dims));
    }
}
