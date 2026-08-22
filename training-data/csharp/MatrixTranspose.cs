using System;

class MatrixTranspose
{
    static int[,] Transpose(int[,] matrix)
    {
        int rows = matrix.GetLength(0), cols = matrix.GetLength(1);
        var result = new int[cols, rows];
        for (int i = 0; i < rows; i++)
            for (int j = 0; j < cols; j++)
                result[j, i] = matrix[i, j];
        return result;
    }

    static void Main()
    {
        var m = new int[,] { { 1, 2, 3 }, { 4, 5, 6 } };
        var t = Transpose(m);
        for (int i = 0; i < t.GetLength(0); i++)
        {
            for (int j = 0; j < t.GetLength(1); j++) Console.Write(t[i, j] + " ");
            Console.WriteLine();
        }
    }
}
