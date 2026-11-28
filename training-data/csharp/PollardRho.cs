using System;
using System.Numerics;

class PollardRho
{
    static long Rho(long n)
    {
        if (n % 2 == 0) return 2;
        long x = 2, y = 2, d = 1;
        long F(long v) => (v * v + 1) % n;
        while (d == 1)
        {
            x = F(x); y = F(F(y));
            d = (long)BigInteger.GreatestCommonDivisor(Math.Abs(x - y), n);
        }
        return d;
    }

    static void Main()
    {
        long n = 8051, p = Rho(n);
        Console.WriteLine($"{n} = {p} * {n / p}");
    }
}
