// Repunits: numbers made only of the digit 1.
using System;
using System.Collections.Generic;

class RepunitNumbers
{
    static IEnumerable<long> Repunits(int count)
    {
        long r = 0;
        for (int i = 0; i < count; i++)
        {
            r = r * 10 + 1;
            yield return r;
        }
    }

    static void Main() => Console.WriteLine(string.Join(" ", Repunits(5)));
}
