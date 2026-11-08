using System;

class SecantMethod
{
    static double Secant(Func<double, double> f, double a, double b)
    {
        for (int i = 0; i < 40; i++)
        {
            double fa = f(a), fb = f(b);
            if (fa == fb) break;
            (a, b) = (b, b - fb * (b - a) / (fb - fa));
        }
        return b;
    }

    static void Main() => Console.WriteLine(Secant(x => x * x - 2, 1, 2).ToString("F8"));
}
