using System;

// n(n+1)(n+2)(n+3)/24
class PentatopeNumbers
{
    static long Term(long n) => (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24;

    static void Main()
    {
        for (long n = 1; n <= 15; n++)
            Console.WriteLine($"{n} -> {Term(n)}");
    }
}
