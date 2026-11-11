// Amicable pairs: d(a) == b and d(b) == a with a != b.
using System;

class AmicablePairs
{
    static int D(int n)
    {
        int s = 0;
        for (int i = 1; i < n; i++) if (n % i == 0) s += i;
        return s;
    }

    static void Main()
    {
        for (int a = 2; a < 1500; a++)
        {
            int b = D(a);
            if (b > a && D(b) == a) Console.WriteLine($"({a}, {b})");
        }
    }
}
