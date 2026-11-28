using System;
using System.Linq;

static class Factorions
{
    static void Main()
    {
        int[] fact = { 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 };
        var result = Enumerable.Range(1, 49999).Where(n => n.ToString().Sum(c => fact[c - '0']) == n);
        Console.WriteLine(string.Join(" ", result)); // 1 2 145 40585
    }
}
