using System;

class GradientDescentDemo
{
    static double GradientDescent(Func<double, double> gradFn, double start, double learningRate, int iterations)
    {
        double x = start;
        for (int i = 0; i < iterations; i++) x -= learningRate * gradFn(x);
        return x;
    }

    static void Main()
    {
        double minimum = GradientDescent(x => 2 * (x - 3), 0, 0.1, 50);
        Console.WriteLine(minimum);
    }
}
