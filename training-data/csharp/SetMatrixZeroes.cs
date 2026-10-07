using System;
using System.Collections.Generic;
using System.Linq;

class SetMatrixZeroes
{
    static void SetZeroes(int[][] m)
    {
        var rows = new HashSet<int>();
        var cols = new HashSet<int>();
        for (int r = 0; r < m.Length; r++)
            for (int c = 0; c < m[r].Length; c++)
                if (m[r][c] == 0) { rows.Add(r); cols.Add(c); }
        for (int r = 0; r < m.Length; r++)
            for (int c = 0; c < m[r].Length; c++)
                if (rows.Contains(r) || cols.Contains(c)) m[r][c] = 0;
    }

    static void Main()
    {
        int[][] m = { new[] { 0, 1, 2, 0 }, new[] { 3, 4, 5, 2 }, new[] { 1, 3, 1, 5 } };
        SetZeroes(m);
        Console.WriteLine(string.Join("\n", m.Select(row => string.Join(" ", row))));
    }
}
