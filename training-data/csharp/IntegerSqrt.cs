using System;
using System.Numerics;

class IntegerSqrt
{
    static ulong Isqrt(ulong n)
    {
        if (n < 2) return n;
        ulong x = n, y = x / 2;
        while (y < x)
        {
            x = y;
            y = (x + n / x) / 2;
        }
        return x;
    }

    static BigInteger Isqrt(BigInteger n)
    {
        if (n < 2) return n;
        BigInteger x = BigInteger.One << (int)((n.GetBitLength() + 1) / 2);
        while (true)
        {
            BigInteger y = (x + n / x) >> 1;
            if (y >= x) return x;
            x = y;
        }
    }

    static void Main()
    {
        foreach (ulong n in new ulong[] { 0, 1, 2, 3, 15, 16, 17, ulong.MaxValue }) Console.WriteLine($"isqrt({n}) = {Isqrt(n)}");
        var big = BigInteger.Pow(10, 60) + 12345;
        Console.WriteLine($"isqrt(10^60 + 12345) = {Isqrt(big)}");
    }
}
