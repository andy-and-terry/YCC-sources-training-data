// Emirps below 200; expect 15.
using System;
using System.Linq;

class Emirps
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    static void Main()
    {
        var found = Enumerable.Range(2, 198).Where(n =>
        {
            int r = int.Parse(new string(n.ToString().Reverse().ToArray()));
            return r != n && IsPrime(n) && IsPrime(r);
        }).ToList();
        Console.WriteLine($"{found.Count}: {string.Join(" ", found)}");
    }
}
