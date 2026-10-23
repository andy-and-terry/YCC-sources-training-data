using System;
using System.Linq;

public static class WoodallNumbers
{
    public static long Woodall(int n) => n * (1L << n) - 1;

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 10).Select(Woodall)));
    }
}
