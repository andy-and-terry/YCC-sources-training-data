// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
using System;
using System.Collections.Generic;

class JacobsthalNumbers
{
    static IEnumerable<long> Jacobsthal()
    {
        long a = 0, b = 1;
        while (true)
        {
            yield return a;
            (a, b) = (b, b + 2 * a);
        }
    }

    static void Main()
    {
        int count = 0;
        var terms = new List<long>();
        foreach (var j in Jacobsthal())
        {
            if (count++ == 15) break;
            terms.Add(j);
        }
        Console.WriteLine(string.Join(" ", terms));
    }
}
