using System;
using System.Linq;

public static class SphenicNumbers
{
    static bool IsSphenic(int n)
    {
        int distinct = 0;
        for (int p = 2; p * p <= n; p++)
        {
            if (n % p != 0) continue;
            n /= p;
            if (n % p == 0) return false;
            distinct++;
        }
        return distinct + (n > 1 ? 1 : 0) == 3;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(2, 78).Where(IsSphenic)));
    }
}
