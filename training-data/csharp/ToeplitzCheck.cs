using System;

class ToeplitzCheck
{
    static bool IsToeplitz(int[][] m)
    {
        for (int i = 1; i < m.Length; i++)
            for (int j = 1; j < m[i].Length; j++)
                if (m[i][j] != m[i - 1][j - 1]) return false;
        return true;
    }

    static void Main()
    {
        Console.WriteLine(IsToeplitz(new[] { new[] { 1, 2, 3 }, new[] { 4, 1, 2 }, new[] { 5, 4, 1 } }));
        Console.WriteLine(IsToeplitz(new[] { new[] { 1, 2 }, new[] { 2, 2 } }));
    }
}
