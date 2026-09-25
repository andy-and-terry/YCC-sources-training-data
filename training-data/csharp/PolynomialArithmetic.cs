using System;
using System.Collections.Generic;
using System.Linq;

sealed class Polynomial
{
    readonly long[] c; // c[i] = coefficient of x^i

    public Polynomial(params long[] coeffs)
    {
        int n = coeffs.Length;
        while (n > 1 && coeffs[n - 1] == 0) n--;
        c = n == 0 ? new long[] { 0 } : coeffs[..n];
    }

    public int Degree => c.Length - 1;

    public static Polynomial operator +(Polynomial a, Polynomial b) =>
        new(Enumerable.Range(0, Math.Max(a.c.Length, b.c.Length))
            .Select(i => (i < a.c.Length ? a.c[i] : 0) + (i < b.c.Length ? b.c[i] : 0)).ToArray());

    public static Polynomial operator *(Polynomial a, Polynomial b)
    {
        var r = new long[a.c.Length + b.c.Length - 1];
        for (int i = 0; i < a.c.Length; i++)
            for (int j = 0; j < b.c.Length; j++) r[i + j] += a.c[i] * b.c[j];
        return new Polynomial(r);
    }

    public long Evaluate(long x) => c.Reverse().Aggregate(0L, (acc, k) => acc * x + k);

    public Polynomial Derivative() => new(c.Skip(1).Select((k, i) => k * (i + 1)).ToArray());

    public override string ToString()
    {
        var terms = new List<string>();
        for (int i = c.Length - 1; i >= 0; i--)
        {
            if (c[i] == 0 && c.Length > 1) continue;
            string coef = c[i] == 1 && i > 0 ? "" : c[i].ToString();
            terms.Add(i switch { 0 => coef, 1 => coef + "x", _ => $"{coef}x^{i}" });
        }
        return string.Join(" + ", terms);
    }
}

class PolynomialArithmetic
{
    static void Main()
    {
        var p = new Polynomial(1, 1);
        var cube = p * p * p;
        Console.WriteLine($"{cube} | {cube.Derivative()} | {cube.Evaluate(2)} | degree {cube.Degree}");
        Console.WriteLine(new Polynomial(-1, 0, 1) + new Polynomial(1, 0, -1));
    }
}
