using System;
using System.Collections.Generic;

class AStarPathfinding
{
    static int Heuristic((int, int) a, (int, int) b) =>
        Math.Abs(a.Item1 - b.Item1) + Math.Abs(a.Item2 - b.Item2);

    static List<(int, int)> FindPath(int[,] grid, (int, int) start, (int, int) goal)
    {
        int rows = grid.GetLength(0), cols = grid.GetLength(1);
        var open = new SortedSet<(int F, (int, int) Pos)>(Comparer<(int, (int, int))>.Create(
            (a, b) => a.Item1 != b.Item1 ? a.Item1.CompareTo(b.Item1) : a.Item2.CompareTo(b.Item2)));
        var gScore = new Dictionary<(int, int), int> { [start] = 0 };
        var cameFrom = new Dictionary<(int, int), (int, int)>();
        open.Add((Heuristic(start, goal), start));

        var dirs = new (int, int)[] { (1, 0), (-1, 0), (0, 1), (0, -1) };

        while (open.Count > 0)
        {
            var (_, current) = open.Min;
            open.Remove(open.Min);

            if (current == goal)
            {
                var path = new List<(int, int)> { current };
                while (cameFrom.ContainsKey(current))
                {
                    current = cameFrom[current];
                    path.Add(current);
                }
                path.Reverse();
                return path;
            }

            foreach (var (dr, dc) in dirs)
            {
                var next = (current.Item1 + dr, current.Item2 + dc);
                if (next.Item1 < 0 || next.Item1 >= rows || next.Item2 < 0 || next.Item2 >= cols) continue;
                if (grid[next.Item1, next.Item2] == 1) continue;

                int tentative = gScore[current] + 1;
                if (!gScore.ContainsKey(next) || tentative < gScore[next])
                {
                    gScore[next] = tentative;
                    cameFrom[next] = current;
                    open.Add((tentative + Heuristic(next, goal), next));
                }
            }
        }

        return new List<(int, int)>();
    }

    static void Main()
    {
        var grid = new int[,]
        {
            { 0, 0, 0, 0 },
            { 0, 1, 1, 0 },
            { 0, 0, 0, 0 },
        };
        var path = FindPath(grid, (0, 0), (2, 3));
        Console.WriteLine(string.Join(" -> ", path));
    }
}
