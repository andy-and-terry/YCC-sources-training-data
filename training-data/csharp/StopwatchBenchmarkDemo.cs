using System;
using System.Diagnostics;
using System.Linq;

class StopwatchBenchmarkDemo
{
    static long SumLoop(int n)
    {
        long total = 0;
        for (int i = 1; i <= n; i++) total += i;
        return total;
    }

    static long SumLinq(int n) => Enumerable.Range(1, n).Sum(i => (long)i);

    static (long Result, TimeSpan Elapsed) Measure(Func<int, long> f, int n)
    {
        var sw = Stopwatch.StartNew();
        long result = f(n);
        sw.Stop();
        return (result, sw.Elapsed);
    }

    static void Main()
    {
        const int N = 1_000_000;
        var loop = Measure(SumLoop, N);
        var linq = Measure(SumLinq, N);
        Console.WriteLine($"loop result={loop.Result} ok={loop.Elapsed.TotalMilliseconds >= 0}");
        Console.WriteLine($"linq result={linq.Result} same={loop.Result == linq.Result}");
    }
}
