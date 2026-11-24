using System;
using System.Numerics;

// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
class RepunitNumbers
{
    static void Main()
    {
        BigInteger r = 0;
        for (int n = 1; n <= 8; n++)
        {
            r = r * 10 + 1;
            Console.WriteLine(r + (r % 3 == 0 ? "  (divisible by 3)" : ""));
        }
    }
}
