using System;

// n(n+1)(n+2)/6
class TetrahedralNumbers
{
    static long Term(long n) => ((n * (n + 1)) * (n + 2)) / 6;

    static void Main()
    {
        for (long n = 1; n <= 15; n++)
            Console.WriteLine($"{n} -> {Term(n)}");
    }
}
