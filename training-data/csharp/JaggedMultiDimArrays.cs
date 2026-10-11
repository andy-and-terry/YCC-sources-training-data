using System;

class JaggedMultiDimArrays
{
    static void Main()
    {
        int[,] grid = new int[3, 4];
        for (int r = 0; r < 3; r++)
            for (int c = 0; c < 4; c++)
                grid[r, c] = r * 4 + c;
        Console.WriteLine(grid.GetLength(0) + "x" + grid.GetLength(1) + " total " + grid.Length);
        Console.WriteLine(grid[2, 3]);

        int[][] jagged = new int[3][];
        for (int i = 0; i < jagged.Length; i++)
        {
            jagged[i] = new int[i + 1];
            for (int j = 0; j <= i; j++) jagged[i][j] = i + j;
        }
        foreach (var row in jagged) Console.WriteLine(string.Join(" ", row));

        int[,] init = { { 1, 2 }, { 3, 4 } };
        int trace = 0;
        for (int i = 0; i < 2; i++) trace += init[i, i];
        Console.WriteLine(trace);

        var copy = (int[,])init.Clone();
        copy[0, 0] = 99;
        Console.WriteLine(init[0, 0] + " " + copy[0, 0]);
        Array.Sort(jagged[2]);
        Array.Reverse(jagged[2]);
        Console.WriteLine(string.Join(",", jagged[2]));
    }
}
