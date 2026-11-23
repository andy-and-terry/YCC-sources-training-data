using System;

// n(2n^2+1)/3
class OctahedralNumbers
{
    static long Term(long n) => (n * (((2 * n) * n) + 1)) / 3;

    static void Main()
    {
        for (long n = 1; n <= 15; n++)
            Console.WriteLine($"{n} -> {Term(n)}");
    }
}
