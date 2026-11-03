using System;
using System.Linq;

class PerfectSquareCheck
{
    static bool IsPerfectSquare(long n)
    {
        if (n < 0) return false;
        long r = (long)Math.Sqrt(n);
        return r * r == n;
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 30).Where(n => IsPerfectSquare(n))));
}
