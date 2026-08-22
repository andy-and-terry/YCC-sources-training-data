using System;
using System.Collections.Generic;

class NQueensDemo
{
    static List<int[]> Solve(int n)
    {
        var solutions = new List<int[]>();
        var columns = new HashSet<int>();
        var diagonals = new HashSet<int>();
        var antiDiagonals = new HashSet<int>();
        var board = new int[n];

        void Backtrack(int row)
        {
            if (row == n)
            {
                solutions.Add((int[])board.Clone());
                return;
            }
            for (int col = 0; col < n; col++)
            {
                if (columns.Contains(col) || diagonals.Contains(row - col) || antiDiagonals.Contains(row + col)) continue;
                columns.Add(col);
                diagonals.Add(row - col);
                antiDiagonals.Add(row + col);
                board[row] = col;
                Backtrack(row + 1);
                columns.Remove(col);
                diagonals.Remove(row - col);
                antiDiagonals.Remove(row + col);
            }
        }

        Backtrack(0);
        return solutions;
    }

    static void Main()
    {
        Console.WriteLine(Solve(6).Count);
    }
}
