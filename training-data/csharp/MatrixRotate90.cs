using System;

class MatrixRotate90
{
    static T[,] RotateClockwise<T>(T[,] m)
    {
        int rows = m.GetLength(0), cols = m.GetLength(1);
        var r = new T[cols, rows];
        for (int i = 0; i < rows; i++)
            for (int j = 0; j < cols; j++)
                r[j, rows - 1 - i] = m[i, j];
        return r;
    }

    static void Print<T>(T[,] m)
    {
        for (int i = 0; i < m.GetLength(0); i++)
        {
            for (int j = 0; j < m.GetLength(1); j++) Console.Write($"{m[i, j],3}");
            Console.WriteLine();
        }
        Console.WriteLine();
    }

    static void Main()
    {
        var m = new[,] { { 1, 2, 3, 4 }, { 5, 6, 7, 8 } };
        Print(RotateClockwise(m));
        Print(RotateClockwise(RotateClockwise(m)));
    }
}
