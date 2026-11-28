using System;

class SecantMethod
{
    static double Secant(Func<double, double> f, double x0, double x1)
    {
        for (int i = 0; i < 50; i++)
        {
            double f0 = f(x0), f1 = f(x1);
            if (f1 == f0) break;
            (x0, x1) = (x1, x1 - f1 * (x1 - x0) / (f1 - f0));
            if (Math.Abs(x1 - x0) < 1e-12) break;
        }
        return x1;
    }

    static void Main() => Console.WriteLine(Secant(x => x * x - 2, 1, 2));
}
