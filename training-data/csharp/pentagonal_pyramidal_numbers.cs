using System;

// n^2(n+1)/2
class PentagonalPyramidalNumbers
{
    static long Term(long n) => ((n * n) * (n + 1)) / 2;

    static void Main()
    {
        for (long n = 1; n <= 15; n++)
            Console.WriteLine($"{n} -> {Term(n)}");
    }
}
