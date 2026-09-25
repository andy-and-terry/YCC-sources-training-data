using System;

class NewtonSqrt
{
    static (double Root, int Iterations) Newton(Func<double, double> f, Func<double, double> df, double x0, double tol = 1e-12, int maxIter = 100)
    {
        double x = x0;
        for (int i = 1; i <= maxIter; i++)
        {
            double d = df(x);
            if (d == 0) throw new ArithmeticException($"zero derivative at x = {x}");
            double next = x - f(x) / d;
            if (Math.Abs(next - x) < tol) return (next, i);
            x = next;
        }
        throw new ArithmeticException("did not converge");
    }

    static void Main()
    {
        foreach (double a in new[] { 2.0, 9.0, 0.25, 1e10 })
        {
            var (root, it) = Newton(x => x * x - a, x => 2 * x, Math.Max(a, 1));
            Console.WriteLine($"sqrt({a}) = {root:F12} in {it} iterations (Math.Sqrt {Math.Sqrt(a):F12})");
        }
        try
        {
            Newton(x => x * x + 1, x => 2 * x, 0);
        }
        catch (ArithmeticException e)
        {
            Console.WriteLine($"x^2+1: {e.Message}");
        }
    }
}
