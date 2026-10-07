using System;

class BestTimeToBuyAndSellStock
{
    static int MaxProfit(int[] prices)
    {
        if (prices.Length == 0) return 0;

        int minPrice = prices[0];
        int bestProfit = 0;

        foreach (var price in prices)
        {
            minPrice = Math.Min(minPrice, price);
            bestProfit = Math.Max(bestProfit, price - minPrice);
        }

        return bestProfit;
    }

    static void Main()
    {
        Console.WriteLine(MaxProfit(new[] { 7, 1, 5, 3, 6, 4 }));
    }
}
