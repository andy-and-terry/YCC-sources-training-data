using System;

class MatrixFibonacci
{
    static ulong[,] Multiply(ulong[,] a, ulong[,] b)
    {
        var r = new ulong[2, 2];
        for (int i = 0; i < 2; i++)
            for (int j = 0; j < 2; j++)
                for (int k = 0; k < 2; k++)
                    r[i, j] += a[i, k] * b[k, j];
        return r;
    }

    static ulong Fib(int n)
    {
        var result = new ulong[,] { { 1, 0 }, { 0, 1 } };
        var baseM = new ulong[,] { { 1, 1 }, { 1, 0 } };
        while (n > 0)
        {
            if ((n & 1) == 1) result = Multiply(result, baseM);
            baseM = Multiply(baseM, baseM);
            n >>= 1;
        }
        return result[0, 1];
    }

    static void Main()
    {
        foreach (int n in new[] { 1, 10, 50, 90 })
            Console.WriteLine($"Fib({n}) = {Fib(n)}");
    }
}
