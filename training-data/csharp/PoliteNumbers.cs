using System;
using System.Linq;

// Ways to write n as a sum of two or more consecutive positive integers.
class PoliteNumbers
{
    static int PoliteWays(int n)
    {
        int ways = 0;
        for (int k = 2; k * (k + 1) / 2 <= n; k++)
            if ((n - k * (k - 1) / 2) % k == 0) ways++;
        return ways;
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 16).Select(PoliteWays)));
}
