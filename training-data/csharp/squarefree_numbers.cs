// Squarefree numbers up to 100; expect 61.
using System;
using System.Linq;

class SquarefreeNumbers
{
    static bool Squarefree(int n)
    {
        for (int d = 2; d * d <= n; d++) if (n % (d * d) == 0) return false;
        return true;
    }

    static void Main()
    {
        Console.WriteLine(Enumerable.Range(1, 100).Count(Squarefree));
    }
}
