using System;
using System.Collections.Generic;

class RottenOrangesBfs
{
    static int Minutes(int[,] input)
    {
        var g = (int[,])input.Clone();
        int rows = g.GetLength(0), cols = g.GetLength(1), fresh = 0;
        var q = new Queue<(int, int)>();
        for (int r = 0; r < rows; r++)
            for (int c = 0; c < cols; c++)
            {
                if (g[r, c] == 2) q.Enqueue((r, c));
                else if (g[r, c] == 1) fresh++;
            }
        int minutes = 0;
        var dirs = new[] { (1, 0), (-1, 0), (0, 1), (0, -1) };
        while (q.Count > 0 && fresh > 0)
        {
            for (int n = q.Count; n > 0; n--)
            {
                var (r, c) = q.Dequeue();
                foreach (var (dr, dc) in dirs)
                {
                    int nr = r + dr, nc = c + dc;
                    if (nr < 0 || nc < 0 || nr >= rows || nc >= cols || g[nr, nc] != 1) continue;
                    g[nr, nc] = 2;
                    fresh--;
                    q.Enqueue((nr, nc));
                }
            }
            minutes++;
        }
        return fresh == 0 ? minutes : -1;
    }

    static void Main() => Console.WriteLine($"{Minutes(new[,] { { 2, 1, 1 }, { 1, 1, 0 }, { 0, 1, 1 } })} {Minutes(new[,] { { 2, 1, 1 }, { 0, 1, 1 }, { 1, 0, 1 } })}");
}
