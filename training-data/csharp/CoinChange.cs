using System;

class CoinChange
{
    static int Solve(int[] coins, int amount)
    {
        var dp = new int[amount + 1];
        for (int i = 1; i <= amount; i++) dp[i] = int.MaxValue;
        for (int a = 1; a <= amount; a++)
        {
            foreach (int coin in coins)
                if (coin <= a && dp[a - coin] != int.MaxValue) dp[a] = Math.Min(dp[a], dp[a - coin] + 1);
        }
        return dp[amount] == int.MaxValue ? -1 : dp[amount];
    }

    static void Main()
    {
        Console.WriteLine(Solve(new[] { 1, 2, 5 }, 11));
    }
}
