using System;
using System.Collections.Generic;

class FloodFill
{
    static void Fill(int[][] img, int sr, int sc, int color)
    {
        int original = img[sr][sc];
        if (original == color) return;
        var queue = new Queue<(int r, int c)>();
        queue.Enqueue((sr, sc));
        img[sr][sc] = color;
        int[] dr = { 1, -1, 0, 0 };
        int[] dc = { 0, 0, 1, -1 };
        while (queue.Count > 0)
        {
            var (r, c) = queue.Dequeue();
            for (int k = 0; k < 4; k++)
            {
                int nr = r + dr[k], nc = c + dc[k];
                if (nr >= 0 && nr < img.Length && nc >= 0 && nc < img[0].Length && img[nr][nc] == original)
                {
                    img[nr][nc] = color;
                    queue.Enqueue((nr, nc));
                }
            }
        }
    }

    static void Main()
    {
        int[][] img = { new[] { 1, 1, 0 }, new[] { 1, 0, 0 }, new[] { 1, 1, 1 } };
        Fill(img, 0, 0, 7);
        foreach (var row in img)
            Console.WriteLine(string.Join(" ", row));
    }
}
