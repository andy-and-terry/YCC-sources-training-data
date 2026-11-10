using System;
using System.Collections.Generic;

class TwinPrimes
{
    static void Main()
    {
        const int limit = 80;
        var composite = new bool[limit + 1];
        for (int i = 2; i * i <= limit; i++)
            if (!composite[i])
                for (int j = i * i; j <= limit; j += i) composite[j] = true;
        var pairs = new List<string>();
        for (int p = 3; p + 2 <= limit; p++)
            if (!composite[p] && !composite[p + 2]) pairs.Add($"({p},{p + 2})");
        Console.WriteLine(string.Join(" ", pairs)); // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
    }
}
