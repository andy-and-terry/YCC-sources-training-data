using System;
using System.Linq;
using System.Numerics;

class ComplexNumbers
{
    static Complex[] Fft(Complex[] a)
    {
        int n = a.Length;
        if (n == 1) return new[] { a[0] };
        var even = Fft(a.Where((_, i) => i % 2 == 0).ToArray());
        var odd = Fft(a.Where((_, i) => i % 2 == 1).ToArray());
        var result = new Complex[n];
        for (int k = 0; k < n / 2; k++)
        {
            Complex t = Complex.FromPolarCoordinates(1, -2 * Math.PI * k / n) * odd[k];
            result[k] = even[k] + t;
            result[k + n / 2] = even[k] - t;
        }
        return result;
    }

    static string Fmt(Complex c) => $"{c.Real:F3}{(c.Imaginary >= 0 ? "+" : "-")}{Math.Abs(c.Imaginary):F3}i";

    static void Main()
    {
        Complex z1 = new(3, 4), z2 = new(1, -2);
        Console.WriteLine($"{Fmt(z1 + z2)} {Fmt(z1 * z2)} {Fmt(z1 / z2)} |z1|={z1.Magnitude}");
        Console.WriteLine($"e^(i*pi) = {Fmt(Complex.Exp(Complex.ImaginaryOne * Math.PI))}");
        var signal = new double[] { 1, 1, 1, 1, 0, 0, 0, 0 }.Select(x => new Complex(x, 0)).ToArray();
        Console.WriteLine(string.Join(" ", Fft(signal).Select(Fmt)));
    }
}
