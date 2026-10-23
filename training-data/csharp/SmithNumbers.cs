using System;
using System.Collections.Generic;

public static class SmithNumbers
{
    static int DigitSum(int n)
    {
        int s = 0;
        for (; n > 0; n /= 10) s += n % 10;
        return s;
    }

    static bool IsSmith(int n)
    {
        int m = n, sum = 0;
        for (int p = 2; p * p <= m; p++)
        {
            while (m % p == 0)
            {
                sum += DigitSum(p);
                m /= p;
            }
        }
        if (m == n) return false; // prime
        if (m > 1) sum += DigitSum(m);
        return sum == DigitSum(n);
    }

    public static void Main()
    {
        var result = new List<int>();
        for (int i = 2; i < 100; i++)
            if (IsSmith(i)) result.Add(i);
        Console.WriteLine(string.Join(" ", result));
    }
}
