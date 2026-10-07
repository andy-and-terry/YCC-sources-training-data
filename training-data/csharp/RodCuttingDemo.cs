using System;

class RodCuttingDemo
{
    static int MaxRevenue(int[] prices, int length)
    {
        var best = new int[length + 1];
        for (int n = 1; n <= length; n++)
        {
            for (int cut = 1; cut <= n; cut++)
            {
                int revenue = prices[cut - 1] + best[n - cut];
                if (revenue > best[n]) best[n] = revenue;
            }
        }
        return best[length];
    }

    static void Main()
    {
        var prices = new[] { 1, 5, 8, 9, 10, 17, 17, 20 };
        Console.WriteLine(MaxRevenue(prices, 4));
        Console.WriteLine(MaxRevenue(prices, 8));
    }
}
