using System;

public static class MultiplicativePersistence
{
    static int Persistence(long n)
    {
        int steps = 0;
        while (n >= 10)
        {
            long product = 1;
            for (; n > 0; n /= 10) product *= n % 10;
            n = product;
            steps++;
        }
        return steps;
    }

    public static void Main()
    {
        foreach (var n in new long[] { 39, 77, 999, 10 })
            Console.WriteLine($"{n} {Persistence(n)}");
    }
}
