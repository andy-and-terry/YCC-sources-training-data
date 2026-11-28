using System;
using System.Collections.Generic;
using System.Linq;

Console.WriteLine(string.Join(",", Fib().Take(10)));

static IEnumerable<long> Fib()
{
    long a = 0, b = 1;
    while (true)
    {
        yield return a;
        (a, b) = (b, a + b);
    }
}
