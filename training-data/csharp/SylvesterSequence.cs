using System;
using System.Numerics;

// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
class SylvesterSequence
{
    static void Main()
    {
        BigInteger s = 2;
        for (int i = 0; i < 8; i++)
        {
            Console.WriteLine($"s({i}) = {s}");
            s = s * s - s + 1;
        }
    }
}
