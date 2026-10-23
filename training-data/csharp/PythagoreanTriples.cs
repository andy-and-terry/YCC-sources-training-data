using System;
using System.Collections.Generic;
using System.Linq;

class PythagoreanTriples
{
    static int Gcd(int a, int b) => b == 0 ? a : Gcd(b, a % b);

    // Euclid's formula: (m^2 - n^2, 2mn, m^2 + n^2) for coprime m > n of opposite parity.
    static IEnumerable<(int A, int B, int C)> Primitive(int maxC)
    {
        for (int m = 2; m * m + 1 <= maxC; m++)
        {
            for (int n = 1; n < m; n++)
            {
                if ((m - n) % 2 == 0 || Gcd(m, n) != 1) continue;
                int c = m * m + n * n;
                if (c > maxC) continue;
                int a = m * m - n * n, b = 2 * m * n;
                yield return (Math.Min(a, b), Math.Max(a, b), c);
            }
        }
    }

    static void Main()
    {
        var triples = Primitive(100).OrderBy(t => t.C).ToList();
        foreach (var (a, b, c) in triples)
            Console.WriteLine($"{a}^2 + {b}^2 = {c}^2  ({a * a} + {b * b} = {c * c})");
        Console.WriteLine($"Found {triples.Count} primitive triples with hypotenuse <= 100");
    }
}
