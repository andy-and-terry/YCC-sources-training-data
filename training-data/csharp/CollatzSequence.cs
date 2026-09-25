using System;
using System.Collections.Generic;
using System.Linq;

class CollatzSequence
{
    static IEnumerable<long> Sequence(long n)
    {
        while (true)
        {
            yield return n;
            if (n == 1) yield break;
            n = n % 2 == 0 ? n / 2 : 3 * n + 1;
        }
    }

    static void Main()
    {
        var seq = Sequence(27).ToList();
        Console.WriteLine($"{string.Join(" ", seq.Take(10))} ... length {seq.Count}");

        const int Limit = 1_000_000;
        var steps = new int[Limit];
        int best = 1;
        for (int i = 2; i < Limit; i++)
        {
            long n = i;
            int c = 0;
            while (n >= i)
            {
                n = n % 2 == 0 ? n / 2 : 3 * n + 1;
                c++;
            }
            steps[i] = c + steps[n];
            if (steps[i] > steps[best]) best = i;
        }
        Console.WriteLine($"longest under 1e6: {best} ({steps[best]} steps)");
    }
}
