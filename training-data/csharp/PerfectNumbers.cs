using System;

public enum Classification { Perfect, Abundant, Deficient }

public static class PerfectNumbers
{
    static long AliquotSum(long n)
    {
        if (n == 1) return 0;
        long sum = 1;
        for (long i = 2; i * i <= n; i++)
        {
            if (n % i != 0) continue;
            sum += i;
            if (i != n / i) sum += n / i;
        }
        return sum;
    }

    public static Classification Classify(long n) => AliquotSum(n).CompareTo(n) switch
    {
        0 => Classification.Perfect,
        > 0 => Classification.Abundant,
        _ => Classification.Deficient,
    };

    public static void Main()
    {
        foreach (var n in new long[] { 6, 12, 28, 13, 8128 }) Console.WriteLine($"{n} {Classify(n)}");
    }
}
