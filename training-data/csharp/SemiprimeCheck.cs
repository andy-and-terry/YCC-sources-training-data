using System;
using System.Linq;

public static class SemiprimeCheck
{
    static int PrimeFactorCount(int n)
    {
        int count = 0;
        for (int p = 2; p * p <= n; p++)
            while (n % p == 0) { n /= p; count++; }
        return count + (n > 1 ? 1 : 0);
    }

    public static void Main()
    {
        var semiprimes = Enumerable.Range(2, 28).Where(n => PrimeFactorCount(n) == 2);
        Console.WriteLine(string.Join(" ", semiprimes));
    }
}
