using System;

// Cantor pairing function and its inverse.
class CantorPairing
{
    static long Pair(long x, long y) => (x + y) * (x + y + 1) / 2 + y;

    static (long, long) Unpair(long z)
    {
        long w = (long)((Math.Sqrt(8.0 * z + 1) - 1) / 2);
        long y = z - w * (w + 1) / 2;
        return (w - y, y);
    }

    static void Main()
    {
        Console.WriteLine(Pair(3, 4));
        var (x, y) = Unpair(32);
        Console.WriteLine($"{x} {y}");
    }
}
