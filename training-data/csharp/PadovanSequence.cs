using System;
using System.Collections.Generic;

// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
class PadovanSequence
{
    static IEnumerable<long> Padovan(int count)
    {
        long a = 1, b = 1, c = 1;
        for (int i = 0; i < count; i++)
        {
            yield return a;
            (a, b, c) = (b, c, a + b);
        }
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Padovan(15)));
    }
}
