using System;
using System.Collections.Generic;

class IteratorYieldDeferred
{
    static IEnumerable<int> Evens(int max)
    {
        for (int i = 0; i <= max; i += 2)
        {
            Console.WriteLine($"yielding {i}");
            yield return i;
        }
    }

    static void Main()
    {
        var seq = Evens(6);
        Console.WriteLine("created");
        foreach (var x in seq) { if (x > 2) break; }
    }
}
