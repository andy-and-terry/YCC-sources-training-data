using System;
using System.Numerics;

class FastPowerMod
{
    static ulong MulMod(ulong a, ulong b, ulong m) => (ulong)((UInt128)a * b % m);

    static ulong PowMod(ulong b, ulong e, ulong m)
    {
        ulong r = 1 % m;
        for (b %= m; e > 0; e >>= 1)
        {
            if ((e & 1) == 1) r = MulMod(r, b, m);
            b = MulMod(b, b, m);
        }
        return r;
    }

    static void Main()
    {
        Console.WriteLine($"{PowMod(2, 10, 1000)} {PowMod(3, 200, 13)} {PowMod(7, 1_000_000_000_000_000_000, 1_000_000_007)}");
        const ulong P = 18446744073709551557; // largest 64-bit prime
        Console.WriteLine($"{PowMod(2, P - 1, P)} == {BigInteger.ModPow(2, P - 1, P)}");
    }
}
