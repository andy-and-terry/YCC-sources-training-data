using System;
using System.Collections.Generic;

public class MovingAverage
{
    private readonly Queue<double> _window = new();
    private readonly int _size;
    private double _sum;

    public MovingAverage(int size) => _size = size;

    public double Next(double v)
    {
        _window.Enqueue(v);
        _sum += v;
        if (_window.Count > _size) _sum -= _window.Dequeue();
        return _sum / _window.Count;
    }

    public static void Main()
    {
        var ma = new MovingAverage(3);
        foreach (var v in new double[] { 1, 10, 3, 5, 8, 2 }) Console.Write($"{ma.Next(v):F2} ");
        Console.WriteLine();
    }
}
