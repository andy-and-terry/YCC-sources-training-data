using System;
using System.Collections.Generic;

class MazeSolverBfsDemo
{
    static List<(int, int)> Solve(int[,] maze, (int, int) start, (int, int) end)
    {
        int rows = maze.GetLength(0), cols = maze.GetLength(1);
        var queue = new Queue<((int, int), List<(int, int)>)>();
        queue.Enqueue((start, new List<(int, int)> { start }));
        var visited = new HashSet<(int, int)> { start };
        var directions = new[] { (-1, 0), (1, 0), (0, -1), (0, 1) };

        while (queue.Count > 0)
        {
            var (pos, path) = queue.Dequeue();
            if (pos == end) return path;
            foreach (var (dr, dc) in directions)
            {
                var next = (pos.Item1 + dr, pos.Item2 + dc);
                if (next.Item1 >= 0 && next.Item1 < rows && next.Item2 >= 0 && next.Item2 < cols &&
                    maze[next.Item1, next.Item2] == 0 && !visited.Contains(next))
                {
                    visited.Add(next);
                    var newPath = new List<(int, int)>(path) { next };
                    queue.Enqueue((next, newPath));
                }
            }
        }
        return null;
    }

    static void Main()
    {
        var maze = new int[,]
        {
            {0, 1, 0, 0},
            {0, 1, 0, 1},
            {0, 0, 0, 1},
            {1, 1, 0, 0},
        };
        var path = Solve(maze, (0, 0), (3, 3));
        foreach (var (r, c) in path) Console.Write($"({r},{c}) ");
        Console.WriteLine();
    }
}
