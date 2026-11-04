using System;
using System.Collections.Generic;

class SecondLargest
{
    static int? Find(IEnumerable<int> xs)
    {
        int? first = null, second = null;
        foreach (var x in xs)
        {
            if (first is null || x > first) { second = first; first = x; }
            else if (x != first && (second is null || x > second)) second = x;
        }
        return second;
    }

    static void Main()
    {
        Console.WriteLine(Find(new[] { 4, 9, 2, 9, 7 }));
        Console.WriteLine(Find(new[] { 3, 3 })?.ToString() ?? "none");
    }
}
