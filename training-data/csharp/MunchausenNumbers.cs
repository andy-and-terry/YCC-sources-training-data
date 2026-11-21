using System;
using System.Linq;

// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
class MunchausenNumbers
{
    static bool IsMunchausen(int n) =>
        n.ToString().Select(c => c - '0').Sum(d => d == 0 ? 0 : (int)Math.Pow(d, d)) == n;

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 4999).Where(IsMunchausen)));
    }
}
