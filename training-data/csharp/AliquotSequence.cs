using System;
using System.Collections.Generic;
using System.Linq;

// Aliquot sequence: replace n by the sum of its proper divisors.
class AliquotSequence
{
    static int AliquotSum(int n) => Enumerable.Range(1, n / 2).Where(d => n % d == 0).Sum();

    static void Main()
    {
        var seq = new List<int> { 12 };
        while (seq[^1] > 1 && seq.Count < 20) seq.Add(AliquotSum(seq[^1]));
        Console.WriteLine(string.Join(" ", seq));
    }
}
