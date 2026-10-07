using System;

public static class SpiralMatrix
{
    public static int[,] Build(int n)
    {
        var g = new int[n, n];
        int top = 0, left = 0, bottom = n - 1, right = n - 1, k = 1;
        while (top <= bottom && left <= right)
        {
            for (var c = left; c <= right; c++) g[top, c] = k++;
            top++;
            for (var r = top; r <= bottom; r++) g[r, right] = k++;
            right--;
            if (top <= bottom) { for (var c = right; c >= left; c--) g[bottom, c] = k++; bottom--; }
            if (left <= right) { for (var r = bottom; r >= top; r--) g[r, left] = k++; left++; }
        }
        return g;
    }

    public static void Main()
    {
        var g = Build(4);
        for (var r = 0; r < 4; r++)
        {
            for (var c = 0; c < 4; c++) Console.Write($"{g[r, c],3}");
            Console.WriteLine();
        }
    }
}
