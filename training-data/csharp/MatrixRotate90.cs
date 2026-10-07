using System;

public static class MatrixRotate90
{
    public static T[,] RotateClockwise<T>(T[,] m)
    {
        int rows = m.GetLength(0), cols = m.GetLength(1);
        var result = new T[cols, rows];
        for (var r = 0; r < rows; r++)
            for (var c = 0; c < cols; c++)
                result[c, rows - 1 - r] = m[r, c];
        return result;
    }

    public static void Main()
    {
        var m = RotateClockwise(new[,] { { 1, 2, 3 }, { 4, 5, 6 } });
        for (var r = 0; r < m.GetLength(0); r++)
        {
            for (var c = 0; c < m.GetLength(1); c++) Console.Write($"{m[r, c]} ");
            Console.WriteLine();
        }
    }
}
