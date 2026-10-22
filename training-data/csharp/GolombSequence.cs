using System;

public static class GolombSequence
{
    public static int[] Golomb(int count)
    {
        var g = new int[count + 1];
        g[1] = 1;
        for (int n = 2; n <= count; n++)
            g[n] = 1 + g[n - g[g[n - 1]]];
        return g[1..];
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Golomb(20)));
    }
}
