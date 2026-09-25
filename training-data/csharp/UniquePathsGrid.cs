using System;
using System.Linq;

class UniquePathsGrid
{
    static long Paths(int[,] grid)
    {
        int rows = grid.GetLength(0), cols = grid.GetLength(1);
        var dp = new long[cols];
        dp[0] = grid[0, 0] == 0 ? 1 : 0;
        for (int r = 0; r < rows; r++)
            for (int c = 0; c < cols; c++)
                dp[c] = grid[r, c] == 1 ? 0 : dp[c] + (c > 0 ? dp[c - 1] : 0);
        return dp[^1];
    }

    static void Main()
    {
        Console.WriteLine(Paths(new int[3, 7]));
        Console.WriteLine(Paths(new[,] { { 0, 0, 0 }, { 0, 1, 0 }, { 0, 0, 0 } }));
        Console.WriteLine(Paths(new int[17, 17]));
    }
}
