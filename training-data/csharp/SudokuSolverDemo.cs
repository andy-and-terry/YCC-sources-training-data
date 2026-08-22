using System;

class SudokuSolverDemo
{
    static bool IsValid(int[,] board, int row, int col, int num)
    {
        for (int i = 0; i < 9; i++)
            if (board[row, i] == num || board[i, col] == num) return false;
        int boxRow = 3 * (row / 3), boxCol = 3 * (col / 3);
        for (int r = boxRow; r < boxRow + 3; r++)
            for (int c = boxCol; c < boxCol + 3; c++)
                if (board[r, c] == num) return false;
        return true;
    }

    static bool Solve(int[,] board)
    {
        for (int row = 0; row < 9; row++)
        {
            for (int col = 0; col < 9; col++)
            {
                if (board[row, col] == 0)
                {
                    for (int num = 1; num <= 9; num++)
                    {
                        if (IsValid(board, row, col, num))
                        {
                            board[row, col] = num;
                            if (Solve(board)) return true;
                            board[row, col] = 0;
                        }
                    }
                    return false;
                }
            }
        }
        return true;
    }

    static void Main()
    {
        var board = new int[,]
        {
            {5, 3, 0, 0, 7, 0, 0, 0, 0},
            {6, 0, 0, 1, 9, 5, 0, 0, 0},
            {0, 9, 8, 0, 0, 0, 0, 6, 0},
            {8, 0, 0, 0, 6, 0, 0, 0, 3},
            {4, 0, 0, 8, 0, 3, 0, 0, 1},
            {7, 0, 0, 0, 2, 0, 0, 0, 6},
            {0, 6, 0, 0, 0, 0, 2, 8, 0},
            {0, 0, 0, 4, 1, 9, 0, 0, 5},
            {0, 0, 0, 0, 8, 0, 0, 7, 9},
        };
        Solve(board);
        for (int i = 0; i < 9; i++)
        {
            for (int j = 0; j < 9; j++) Console.Write(board[i, j] + " ");
            Console.WriteLine();
        }
    }
}
