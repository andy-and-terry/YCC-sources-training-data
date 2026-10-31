using System;

public static class OddCubesIdentity
{
    static long CubeFromOdds(long n)
    {
        long start = n * n - n + 1, sum = 0;
        for (long i = 0; i < n; i++) sum += start + 2 * i;
        return sum;
    }

    public static void Main()
    {
        for (long n = 1; n <= 5; n++)
            Console.WriteLine($"{n} {CubeFromOdds(n)} {CubeFromOdds(n) == n * n * n}");
    }
}
