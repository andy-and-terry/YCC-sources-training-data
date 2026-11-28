using System;
using System.Linq;

class EmirpPrimes
{
    static bool IsPrime(int n) => n >= 2 && Enumerable.Range(2, Math.Max(0, (int)Math.Sqrt(n) - 1)).All(i => n % i != 0);
    static int Rev(int n) => int.Parse(new string(n.ToString().Reverse().ToArray()));

    static void Main()
    {
        var e = Enumerable.Range(2, 98).Where(p => IsPrime(p) && Rev(p) != p && IsPrime(Rev(p)));
        Console.WriteLine(string.Join(" ", e));
    }
}
