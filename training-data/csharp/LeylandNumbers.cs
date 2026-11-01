using System;
using System.Collections.Generic;
using System.Numerics;

// Leyland numbers: x^y + y^x for x >= y >= 2.
class LeylandNumbers
{
    static BigInteger Leyland(int x, int y) =>
        BigInteger.Pow(x, y) + BigInteger.Pow(y, x);

    static void Main()
    {
        var vals = new List<string>();
        for (int x = 2; x <= 4; x++)
            for (int y = 2; y <= x; y++)
                vals.Add(Leyland(x, y).ToString());
        Console.WriteLine(string.Join(" ", vals));
    }
}
