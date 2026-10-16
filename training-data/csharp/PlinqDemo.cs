using System;
using System.Linq;

class PlinqDemo
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int i = 2; (long)i * i <= n; i++)
            if (n % i == 0) return false;
        return true;
    }

    static void Main()
    {
        int count = Enumerable.Range(1, 50_000).AsParallel().Count(IsPrime);
        Console.WriteLine(count);

        var ordered = Enumerable.Range(1, 20)
            .AsParallel().AsOrdered()
            .Where(n => n % 3 == 0)
            .Select(n => n * n)
            .ToArray();
        Console.WriteLine(string.Join(" ", ordered));

        long sum = Enumerable.Range(1, 1000).AsParallel().Sum(n => (long)n);
        Console.WriteLine(sum);
        Console.WriteLine(Enumerable.Range(1, 100).AsParallel().Aggregate(0, (a, b) => a + b));
    }
}
