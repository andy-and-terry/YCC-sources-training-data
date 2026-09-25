using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;

class CatalanNumbers
{
    static List<BigInteger> Dp(int n)
    {
        var c = new List<BigInteger> { 1 };
        for (int i = 1; i <= n; i++)
        {
            BigInteger sum = 0;
            for (int j = 0; j < i; j++) sum += c[j] * c[i - 1 - j];
            c.Add(sum);
        }
        return c;
    }

    // Enumerates binary tree shapes with n nodes as bracket strings.
    static IEnumerable<string> Trees(int n)
    {
        if (n == 0)
        {
            yield return ".";
            yield break;
        }
        for (int left = 0; left < n; left++)
            foreach (var l in Trees(left))
                foreach (var r in Trees(n - 1 - left))
                    yield return $"({l}{r})";
    }

    static void Main()
    {
        var c = Dp(50);
        foreach (int i in new[] { 0, 5, 10, 30, 50 }) Console.WriteLine($"C({i}) = {c[i]}");
        Console.WriteLine(string.Join(" ", Trees(3)));
        Console.WriteLine($"trees(7) = {Trees(7).Count()} == {c[7]}");
    }
}
