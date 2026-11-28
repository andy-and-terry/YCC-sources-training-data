using System;
using System.Linq;

static class AutomorphicNumbers
{
    static bool IsAutomorphic(long n) => (n * n).ToString().EndsWith(n.ToString());

    static void Main()
    {
        var result = Enumerable.Range(0, 1000).Where(n => IsAutomorphic(n));
        Console.WriteLine(string.Join(" ", result)); // 0 1 5 6 25 76 376 625
    }
}
