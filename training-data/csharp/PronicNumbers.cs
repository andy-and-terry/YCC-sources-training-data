using System;
using System.Linq;

static class PronicNumbers
{
    static bool IsPronic(long x)
    {
        long n = (long)Math.Sqrt(x);
        return n * (n + 1) == x;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(n => n * (n + 1))));
        // 0 2 6 12 20 30 42 56 72 90
        Console.WriteLine($"{IsPronic(56)} {IsPronic(57)}"); // True False
    }
}
