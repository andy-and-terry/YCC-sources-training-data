using System;
using System.Collections.Generic;
using System.Linq;

public static class SaddlePoints
{
    public static IEnumerable<(int Row, int Col)> Find(int[][] m)
    {
        if (m.Length == 0) yield break;
        var colMin = Enumerable.Range(0, m[0].Length).Select(c => m.Min(row => row[c])).ToArray();
        for (var r = 0; r < m.Length; r++)
        {
            var rowMax = m[r].Max();
            for (var c = 0; c < m[r].Length; c++)
                if (m[r][c] == rowMax && m[r][c] == colMin[c]) yield return (r, c);
        }
    }

    public static void Main()
    {
        int[][] m = { new[] { 9, 8, 7 }, new[] { 5, 3, 2 }, new[] { 6, 6, 7 } };
        Console.WriteLine(string.Join(", ", Find(m)));
    }
}
