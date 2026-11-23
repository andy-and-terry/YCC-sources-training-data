using System;

// 2n(n-1)+1
class CenteredSquareNumbers
{
    static long Term(long n) => ((2 * n) * (n - 1)) + 1;

    static void Main()
    {
        for (long n = 1; n <= 15; n++)
            Console.WriteLine($"{n} -> {Term(n)}");
    }
}
