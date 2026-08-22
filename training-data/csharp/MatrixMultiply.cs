using System;

class MatrixMultiply
{
    static int[,] Multiply(int[,] a, int[,] b)
    {
        int rowsA = a.GetLength(0), colsA = a.GetLength(1), colsB = b.GetLength(1);
        var result = new int[rowsA, colsB];
        for (int i = 0; i < rowsA; i++)
            for (int j = 0; j < colsB; j++)
            {
                int sum = 0;
                for (int k = 0; k < colsA; k++) sum += a[i, k] * b[k, j];
                result[i, j] = sum;
            }
        return result;
    }

    static void Main()
    {
        var a = new int[,] { { 1, 2 }, { 3, 4 } };
        var b = new int[,] { { 5, 6 }, { 7, 8 } };
        var r = Multiply(a, b);
        for (int i = 0; i < 2; i++)
        {
            for (int j = 0; j < 2; j++) Console.Write(r[i, j] + " ");
            Console.WriteLine();
        }
    }
}
