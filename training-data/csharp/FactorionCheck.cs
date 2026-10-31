using System;
using System.Linq;

public static class FactorionCheck
{
    static readonly int[] Fact = { 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 };

    static bool IsFactorion(int n)
    {
        int sum = 0;
        for (int m = n; m > 0; m /= 10) sum += Fact[m % 10];
        return sum == n;
    }

    public static void Main()
    {
        var found = Enumerable.Range(1, 49999).Where(IsFactorion);
        Console.WriteLine(string.Join(" ", found));
    }
}
