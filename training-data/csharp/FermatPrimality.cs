// Fermat primality test; Carmichael number 561 fools it.
using System;
using System.Numerics;

class FermatPrimality
{
    static bool ProbablyPrime(long n) =>
        n > 2 && BigInteger.ModPow(2, n - 1, n) == BigInteger.One;

    static void Main()
    {
        foreach (var n in new long[] { 97, 91, 561 })
            Console.WriteLine($"{n} {ProbablyPrime(n)}");
    }
}
