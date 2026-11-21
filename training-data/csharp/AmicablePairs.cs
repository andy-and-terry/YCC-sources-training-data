using System;
using System.Linq;

// Amicable pairs below 1500 via sums of proper divisors.
class AmicablePairs
{
    static int S(int n) => Enumerable.Range(1, n - 1).Where(d => n % d == 0).Sum();

    static void Main()
    {
        for (int a = 2; a < 1500; a++)
        {
            int b = S(a);
            if (b > a && S(b) == a) Console.WriteLine($"{a} {b}");
        }
    }
}
