using System;
using System.Linq;

// Positive n expressible as a*a + b*b with a, b >= 0.
class SumOfTwoSquares
{
    static bool Representable(int n)
    {
        for (int a = 0; a * a <= n; a++)
        {
            int b = (int)Math.Round(Math.Sqrt(n - a * a));
            if (a * a + b * b == n) return true;
        }
        return false;
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 30).Where(Representable)));
}
