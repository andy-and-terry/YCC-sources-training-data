using System;
using System.Collections.Generic;
using System.Linq;

class FloodFill
{
    static int Fill(char[][] grid, int sr, int sc, char color)
    {
        char target = grid[sr][sc];
        if (target == color) return 0;
        var stack = new Stack<(int R, int C)>();
        stack.Push((sr, sc));
        int filled = 0;
        while (stack.Count > 0)
        {
            var (r, c) = stack.Pop();
            if (r < 0 || c < 0 || r >= grid.Length || c >= grid[r].Length || grid[r][c] != target) continue;
            grid[r][c] = color;
            filled++;
            stack.Push((r + 1, c));
            stack.Push((r - 1, c));
            stack.Push((r, c + 1));
            stack.Push((r, c - 1));
        }
        return filled;
    }

    static void Main()
    {
        var img = new[] { "..####..", ".#....#.", ".#....#.", "..####.." }.Select(s => s.ToCharArray()).ToArray();
        Console.WriteLine($"filled {Fill(img, 1, 3, 'o')}");
        foreach (var row in img) Console.WriteLine(new string(row));
    }
}
