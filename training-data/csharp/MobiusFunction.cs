using System;
using System.Linq;

// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
class MobiusFunction
{
    static int Mobius(int n)
    {
        int result = 1;
        for (int p = 2; p * p <= n; p++)
        {
            if (n % p == 0)
            {
                n /= p;
                if (n % p == 0) return 0;
                result = -result;
            }
        }
        return n > 1 ? -result : result;
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 30).Select(Mobius)));
}
