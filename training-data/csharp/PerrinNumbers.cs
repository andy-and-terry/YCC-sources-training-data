using System;
using System.Collections.Generic;

// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
class PerrinNumbers
{
    static void Main()
    {
        var p = new List<long> { 3, 0, 2 };
        for (int n = 3; n < 15; n++) p.Add(p[n - 2] + p[n - 3]);
        Console.WriteLine(string.Join(" ", p));
    }
}
