using System;

// n(n+1)/2+1
class LazyCatererSequence
{
    static long Term(long n) => ((n * (n + 1)) / 2) + 1;

    static void Main()
    {
        for (long n = 1; n <= 15; n++)
            Console.WriteLine($"{n} -> {Term(n)}");
    }
}
