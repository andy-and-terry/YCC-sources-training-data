using System;

// 3n(n-1)+1
class CenteredHexagonalNumbers
{
    static long Term(long n) => ((3 * n) * (n - 1)) + 1;

    static void Main()
    {
        for (long n = 1; n <= 15; n++)
            Console.WriteLine($"{n} -> {Term(n)}");
    }
}
