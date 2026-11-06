// Emirps: primes whose digit reversal is a different prime.
using System;
using System.Linq;

class EmirpNumbers
{
    static bool IsPrime(int n) =>
        n >= 2 && Enumerable.Range(2, Math.Max(0, (int)Math.Sqrt(n) - 1)).All(i => n % i != 0);

    static int Reverse(int n) => int.Parse(new string(n.ToString().Reverse().ToArray()));

    static void Main()
    {
        var emirps = Enumerable.Range(2, 98)
            .Where(n => Reverse(n) != n && IsPrime(n) && IsPrime(Reverse(n)));
        Console.WriteLine(string.Join(" ", emirps));
    }
}
