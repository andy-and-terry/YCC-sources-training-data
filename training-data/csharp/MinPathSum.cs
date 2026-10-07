using System;
using System.Collections.Generic;

class MinPathSum
{
    // Dijkstra with PriorityQueue, allowing moves in all four directions.
    static int Solve(int[,] g)
    {
        int rows = g.GetLength(0), cols = g.GetLength(1);
        var dist = new int[rows, cols];
        for (int r = 0; r < rows; r++)
            for (int c = 0; c < cols; c++) dist[r, c] = int.MaxValue;
        var pq = new PriorityQueue<(int R, int C), int>();
        dist[0, 0] = g[0, 0];
        pq.Enqueue((0, 0), g[0, 0]);
        var dirs = new[] { (1, 0), (-1, 0), (0, 1), (0, -1) };
        while (pq.TryDequeue(out var cell, out int d))
        {
            if (d > dist[cell.R, cell.C]) continue;
            foreach (var (dr, dc) in dirs)
            {
                int nr = cell.R + dr, nc = cell.C + dc;
                if (nr < 0 || nc < 0 || nr >= rows || nc >= cols) continue;
                int nd = d + g[nr, nc];
                if (nd < dist[nr, nc])
                {
                    dist[nr, nc] = nd;
                    pq.Enqueue((nr, nc), nd);
                }
            }
        }
        return dist[rows - 1, cols - 1];
    }

    static void Main()
    {
        Console.WriteLine(Solve(new[,] { { 1, 3, 1 }, { 1, 5, 1 }, { 4, 2, 1 } }));
        Console.WriteLine(Solve(new[,] { { 1, 9, 1, 1, 1 }, { 1, 9, 1, 9, 1 }, { 1, 1, 1, 9, 1 } }));
    }
}
