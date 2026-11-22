using System;
using System.Collections.Generic;
using System.Numerics;

// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
class RepunitNumbers
{
    static void Main()
    {
        BigInteger r = 0;
        var parts = new List<string>();
        for (int i = 0; i < 8; i++)
        {
            r = r * 10 + 1;
            parts.Add(r.ToString());
        }
        Console.WriteLine(string.Join(" ", parts));
    }
}
