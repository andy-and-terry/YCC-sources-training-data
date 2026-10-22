using System;
using System.Collections.Generic;
using System.Linq;

public static class AliquotSequence
{
    public static int ProperDivisorSum(int n)
    {
        return Enumerable.Range(1, n / 2).Where(d => n % d == 0).Sum();
    }

    public static void Main()
    {
        int n = 12;
        var seq = new List<int> { n };
        while (n != 0)
        {
            n = ProperDivisorSum(n);
            seq.Add(n);
        }
        Console.WriteLine(string.Join(" ", seq));
    }
}
