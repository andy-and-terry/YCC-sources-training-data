using System;
using System.Linq;

// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
class PracticalNumbers
{
    static bool IsPractical(int n)
    {
        ulong reach = 1; // bit i set <=> i is a subset sum
        for (int d = 1; d <= n; d++) if (n % d == 0) reach |= reach << d;
        ulong mask = (1UL << (n + 1)) - 1;
        return (reach & mask) == mask;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 40).Where(IsPractical)));
    }
}
