using System;
using System.Collections.Generic;

class LocalFunctionsDemo
{
    static IEnumerable<int> Take(int count)
    {
        if (count < 0) throw new ArgumentOutOfRangeException(nameof(count));
        return Iterate();

        IEnumerable<int> Iterate()
        {
            for (int i = 0; i < count; i++) yield return i;
        }
    }

    static int Fib(int n)
    {
        return Go(n);
        static int Go(int k) => k < 2 ? k : Go(k - 1) + Go(k - 2);
    }

    static void Main()
    {
        Console.WriteLine(string.Join(",", Take(5)));
        Console.WriteLine(Fib(10));
        try { Take(-1); }
        catch (ArgumentOutOfRangeException) { Console.WriteLine("validated eagerly"); }
    }
}
