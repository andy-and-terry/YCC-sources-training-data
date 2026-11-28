using System;
using System.Linq;

static class EmirpNumbers
{
    static bool IsPrime(int n) => n >= 2 && Enumerable.Range(2, (int)Math.Sqrt(n) - 1).All(d => n % d != 0);

    static int Reverse(int n) => int.Parse(new string(n.ToString().Reverse().ToArray()));

    static void Main()
    {
        var emirps = Enumerable.Range(2, 198).Where(p => Reverse(p) != p && IsPrime(p) && IsPrime(Reverse(p)));
        Console.WriteLine(string.Join(" ", emirps)); // 13 17 31 37 71 73 79 97 107 ...
    }
}
