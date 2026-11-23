using System;

// 6n(n-1)+1
class StarNumbers
{
    static long Term(long n) => ((6 * n) * (n - 1)) + 1;

    static void Main()
    {
        for (long n = 1; n <= 15; n++)
            Console.WriteLine($"{n} -> {Term(n)}");
    }
}
