using System;
using System.Linq;

class StatisticsFunctionsDemo
{
    static double Mean(double[] values) => values.Average();

    static double Median(double[] values)
    {
        var sorted = values.OrderBy(x => x).ToArray();
        int n = sorted.Length;
        return n % 2 == 0 ? (sorted[n / 2 - 1] + sorted[n / 2]) / 2 : sorted[n / 2];
    }

    static double Variance(double[] values)
    {
        double m = Mean(values);
        return values.Select(x => (x - m) * (x - m)).Average();
    }

    static double Stdev(double[] values) => Math.Sqrt(Variance(values));

    static void Main()
    {
        var data = new[] { 2.0, 4, 4, 4, 5, 5, 7, 9 };
        Console.WriteLine($"{Mean(data)} {Median(data)} {Stdev(data)}");
    }
}
