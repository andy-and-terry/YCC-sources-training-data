using System;

// n(n+1)(2n+1)/6
class SquarePyramidalNumbers
{
    static long Term(long n) => ((n * (n + 1)) * ((2 * n) + 1)) / 6;

    static void Main()
    {
        for (long n = 1; n <= 15; n++)
            Console.WriteLine($"{n} -> {Term(n)}");
    }
}
