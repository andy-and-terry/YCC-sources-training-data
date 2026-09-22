using System;
using System.Collections.Generic;

class AStarSearchDemo
{
    static int Heuristic((int R, int C) a, (int R, int C) b) => Math.Abs(a.R - b.R) + Math.Abs(a.C - b.C);

    static List<(int R, int C)> FindPath(int[,] grid, (int R, int C) start, (int R, int C) goal)
    {
        int rows = grid.GetLength(0), cols = grid.GetLength(1);
        var open = new PriorityQueue<(int R, int C), int>();
        open.Enqueue(start, Heuristic(start, goal));

        var gScore = new Dictionary<(int, int), int> { [start] = 0 };
        var cameFrom = new Dictionary<(int, int), (int, int)>();
        var visited = new HashSet<(int, int)>();

        (int, int)[] dirs = { (-1, 0), (1, 0), (0, -1), (0, 1) };

        while (open.Count > 0)
        {
            var current = open.Dequeue();
            if (current.Equals(goal))
            {
                var path = new List<(int, int)> { current };
                while (cameFrom.TryGetValue(current, out var prev))
                {
                    path.Add(prev);
                    current = prev;
                }
                path.Reverse();
                return path;
            }

            if (!visited.Add(current)) continue;

            foreach (var (dr, dc) in dirs)
            {
                var next = (R: current.R + dr, C: current.C + dc);
                if (next.R < 0 || next.R >= rows || next.C < 0 || next.C >= cols) continue;
                if (grid[next.R, next.C] == 1) continue;

                int tentativeG = gScore[current] + 1;
                if (!gScore.TryGetValue(next, out var existingG) || tentativeG < existingG)
                {
                    gScore[next] = tentativeG;
                    cameFrom[next] = current;
                    open.Enqueue(next, tentativeG + Heuristic(next, goal));
                }
            }
        }

        return new List<(int, int)>();
    }

    static void Main()
    {
        int[,] grid =
        {
            { 0, 0, 0, 0, 0 },
            { 0, 1, 1, 1, 0 },
            { 0, 0, 0, 1, 0 },
            { 1, 1, 0, 1, 0 },
            { 0, 0, 0, 0, 0 },
        };

        var path = FindPath(grid, (0, 0), (4, 4));
        Console.WriteLine(path.Count > 0 ? $"path length: {path.Count - 1}" : "no path");
        foreach (var step in path) Console.Write($"({step.Item1},{step.Item2}) ");
        Console.WriteLine();
    }
}
