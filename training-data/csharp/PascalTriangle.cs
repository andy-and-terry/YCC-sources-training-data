using System;
using System.Linq;
using System.Numerics;

class PascalTriangle
{
    static BigInteger[][] Build(int rows)
    {
        var t = new BigInteger[rows][];
        for (int r = 0; r < rows; r++)
        {
            t[r] = new BigInteger[r + 1];
            t[r][0] = t[r][r] = 1;
            for (int i = 1; i < r; i++) t[r][i] = t[r - 1][i - 1] + t[r - 1][i];
        }
        return t;
    }

    static void Main()
    {
        var t = Build(10);
        int width = string.Join(" ", t[^1]).Length;
        foreach (var row in t)
        {
            string s = string.Join(" ", row);
            Console.WriteLine(s.PadLeft((width + s.Length) / 2));
        }
        Console.WriteLine($"C(100,50) = {Build(101)[100][50]}");
        Console.WriteLine($"row sums are powers of two: {t.Select((row, r) => row.Aggregate(BigInteger.Zero, (a, b) => a + b) == BigInteger.Pow(2, r)).All(x => x)}");
    }
}
