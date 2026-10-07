using System;
using System.Linq;

class MatrixExponentiationFib
{
    const long Mod = 1_000_000_007;

    readonly record struct M2(long A, long B, long C, long D)
    {
        public static M2 operator *(M2 x, M2 y) => new(
            (x.A * y.A + x.B * y.C) % Mod, (x.A * y.B + x.B * y.D) % Mod,
            (x.C * y.A + x.D * y.C) % Mod, (x.C * y.B + x.D * y.D) % Mod);
    }

    static long Fib(long n)
    {
        M2 r = new(1, 0, 0, 1), m = new(1, 1, 1, 0);
        for (; n > 0; n >>= 1)
        {
            if ((n & 1) == 1) r *= m;
            m *= m;
        }
        return r.B;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 15).Select(i => Fib(i))));
        Console.WriteLine($"fib(1e18) mod p = {Fib(1_000_000_000_000_000_000)}");
    }
}
