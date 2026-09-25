using System;
using System.Collections.Generic;
using System.Text;

class RatInMaze
{
    static readonly (char Name, int Dr, int Dc)[] Moves = { ('D', 1, 0), ('L', 0, -1), ('R', 0, 1), ('U', -1, 0) };

    static List<string> Solve(int[,] maze)
    {
        int n = maze.GetLength(0);
        var seen = new bool[n, n];
        var paths = new List<string>();
        var path = new StringBuilder();

        void Dfs(int r, int c)
        {
            if (r == n - 1 && c == n - 1)
            {
                paths.Add(path.ToString());
                return;
            }
            seen[r, c] = true;
            foreach (var (name, dr, dc) in Moves)
            {
                int nr = r + dr, nc = c + dc;
                if (nr < 0 || nc < 0 || nr >= n || nc >= n || maze[nr, nc] == 0 || seen[nr, nc]) continue;
                path.Append(name);
                Dfs(nr, nc);
                path.Length--;
            }
            seen[r, c] = false;
        }

        if (maze[0, 0] == 1) Dfs(0, 0);
        return paths;
    }

    static void Main() => Console.WriteLine(string.Join(" ", Solve(new[,] { { 1, 0, 0, 0 }, { 1, 1, 0, 1 }, { 1, 1, 0, 0 }, { 0, 1, 1, 1 } })));
}
