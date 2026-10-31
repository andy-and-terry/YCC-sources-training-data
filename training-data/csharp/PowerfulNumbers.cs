using System;
using System.Linq;

public static class PowerfulNumbers
{
    static bool IsPowerful(int n)
    {
        for (int p = 2; p * p <= n; p++)
        {
            if (n % p != 0) continue;
            if (n % (p * p) != 0) return false;
            while (n % p == 0) n /= p;
        }
        return n == 1;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 100).Where(IsPowerful)));
    }
}
