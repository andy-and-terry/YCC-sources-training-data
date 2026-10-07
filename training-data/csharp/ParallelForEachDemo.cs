using System;
using System.Linq;
using System.Threading.Tasks;

class ParallelForEachDemo
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
        var numbers = Enumerable.Range(1, 50_000).ToArray();

        int primeCount = 0;
        Parallel.ForEach(numbers, n =>
        {
            if (IsPrime(n)) System.Threading.Interlocked.Increment(ref primeCount);
        });
        Console.WriteLine($"primes: {primeCount}");

        var squares = new long[10];
        Parallel.For(0, squares.Length, i => squares[i] = (long)i * i);
        Console.WriteLine(string.Join(",", squares));

        long sum = numbers.AsParallel().Where(n => n % 7 == 0).Sum(n => (long)n);
        Console.WriteLine(sum);
    }
}
