using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;

class ClimbingStairs
{
    static BigInteger Ways(int n, params int[] steps)
    {
        var dp = new BigInteger[n + 1];
        dp[0] = 1;
        for (int i = 1; i <= n; i++)
            foreach (int s in steps)
                if (s <= i) dp[i] += dp[i - s];
        return dp[n];
    }

    static int MinCost(IEnumerable<int> cost)
    {
        var (a, b) = cost.Aggregate((A: 0, B: 0), (acc, c) => (acc.B, Math.Min(acc.A, acc.B) + c));
        return Math.Min(a, b);
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 10).Select(n => Ways(n, 1, 2))));
        Console.WriteLine($"{Ways(200, 1, 2)} {Ways(10, 1, 3, 5)}");
        Console.WriteLine(MinCost(new[] { 1, 100, 1, 1, 1, 100, 1, 1, 100, 1 }));
    }
}
