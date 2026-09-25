using System;
using System.Collections.Generic;
using System.Linq;

sealed class SimpleMovingAverage
{
    readonly Queue<double> window = new();
    readonly int size;
    double sum;

    public SimpleMovingAverage(int size) => this.size = size;

    public double Add(double x)
    {
        window.Enqueue(x);
        sum += x;
        if (window.Count > size) sum -= window.Dequeue();
        return sum / window.Count;
    }
}

class MovingAverage
{
    static IEnumerable<double> Ema(IEnumerable<double> values, double alpha)
    {
        double? cur = null;
        foreach (var v in values)
        {
            cur = cur is null ? v : alpha * v + (1 - alpha) * cur;
            yield return cur.Value;
        }
    }

    static void Main()
    {
        double[] prices = { 10, 11, 12, 13, 12, 11, 15, 18, 17, 16 };
        var sma = new SimpleMovingAverage(3);
        foreach (var (p, e) in prices.Zip(Ema(prices, 0.5)))
            Console.WriteLine($"{p,5:F1}  sma={sma.Add(p),7:F3}  ema={e,7:F3}");
    }
}
