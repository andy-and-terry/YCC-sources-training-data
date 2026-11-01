using System;
using System.Linq;

// n is triangular iff 8n + 1 is a perfect square.
class TriangularCheck
{
    static bool IsTriangular(int n)
    {
        int s = 8 * n + 1;
        int r = (int)Math.Round(Math.Sqrt(s));
        return r * r == s;
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 21).Where(IsTriangular)));
}
