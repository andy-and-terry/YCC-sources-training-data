using System;
using System.Collections.Generic;
using System.Numerics;

class HarmonicSeries
{
    static BigInteger Gcd(BigInteger a, BigInteger b) => BigInteger.GreatestCommonDivisor(a, b);

    // Exact harmonic numbers as reduced fractions.
    static IEnumerable<(BigInteger Num, BigInteger Den)> Exact(int count)
    {
        BigInteger num = 0, den = 1;
        for (int k = 1; k <= count; k++)
        {
            num = num * k + den;
            den *= k;
            var g = Gcd(num, den);
            num /= g;
            den /= g;
            yield return (num, den);
        }
    }

    static void Main()
    {
        int n = 1;
        foreach (var (num, den) in Exact(10))
        {
            Console.WriteLine($"H({n++}) = {num}/{den} = {(double)num / (double)den:F6}");
        }

        double sum = 0;
        int terms = 0;
        while (sum < 5)
        {
            terms++;
            sum += 1.0 / terms;
        }
        Console.WriteLine($"Sum first exceeds 5 after {terms} terms");

        const double EulerGamma = 0.5772156649;
        Console.WriteLine($"H(1000) ~ ln(1000) + gamma = {Math.Log(1000) + EulerGamma:F6}");
    }
}
