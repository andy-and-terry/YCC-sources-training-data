using System;

public static class DelannoyNumbers
{
    public static long[,] Delannoy(int size)
    {
        var d = new long[size, size];
        for (int m = 0; m < size; m++)
        {
            for (int n = 0; n < size; n++)
            {
                d[m, n] = (m == 0 || n == 0)
                    ? 1
                    : d[m - 1, n] + d[m, n - 1] + d[m - 1, n - 1];
            }
        }
        return d;
    }

    public static void Main()
    {
        var d = Delannoy(10);
        var central = new long[10];
        for (int i = 0; i < 10; i++)
            central[i] = d[i, i];
        Console.WriteLine(string.Join(" ", central));
    }
}
