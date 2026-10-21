using System;
using System.Collections.Generic;

// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
class NarayanaCowsSequence
{
    static void Main()
    {
        var n = new List<long> { 1, 1, 1 };
        for (int i = 3; i < 15; i++) n.Add(n[i - 1] + n[i - 3]);
        Console.WriteLine(string.Join(" ", n));
    }
}
