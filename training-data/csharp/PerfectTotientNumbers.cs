using System;
using System.Linq;
using System.Numerics;

// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
class PerfectTotientNumbers
{
    static int Phi(int n) =>
        Enumerable.Range(1, n).Count(k => BigInteger.GreatestCommonDivisor(k, n) == 1);

    static bool IsPerfectTotient(int n)
    {
        int total = 0;
        for (int m = n; m > 1;)
        {
            m = Phi(m);
            total += m;
        }
        return total == n;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(2, 198).Where(IsPerfectTotient)));
    }
}
