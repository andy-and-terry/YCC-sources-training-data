using System;
using System.Linq;

class DelannoyNumbers
{
    static long CentralDelannoy(int n)
    {
        var g = new long[n + 1, n + 1];
        for (int i = 0; i <= n; i++)
            for (int j = 0; j <= n; j++)
                g[i, j] = (i == 0 || j == 0) ? 1 : g[i - 1, j] + g[i, j - 1] + g[i - 1, j - 1];
        return g[n, n];
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 6).Select(CentralDelannoy))); // 1 3 13 63 321 1683
}
