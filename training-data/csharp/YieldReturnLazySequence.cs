using System;
using System.Collections.Generic;

class Program
{
    static IEnumerable<int> Collatz(int n)
    {
        while (n != 1)
        {
            yield return n;
            n = n % 2 == 0 ? n / 2 : 3 * n + 1;
        }
        yield return 1;
    }

    static void Main() => Console.WriteLine(string.Join(" ", Collatz(6)));
}
