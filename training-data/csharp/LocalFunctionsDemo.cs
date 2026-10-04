using System;
using System.Collections.Generic;

class LocalFunctionsDemo
{
    static IEnumerable<int> Range(int start, int count)
    {
        if (count < 0) throw new ArgumentOutOfRangeException(nameof(count));
        return Iterate();

        IEnumerable<int> Iterate()
        {
            for (int i = 0; i < count; i++) yield return start + i;
        }
    }

    static int Fibonacci(int n)
    {
        return Fib(n);

        static int Fib(int k) => k < 2 ? k : Fib(k - 1) + Fib(k - 2);
    }

    static void Main()
    {
        Console.WriteLine(string.Join(",", Range(5, 4)));
        Console.WriteLine(Fibonacci(10));
        try { Range(0, -1); }
        catch (ArgumentOutOfRangeException e) { Console.WriteLine("caught eagerly: " + e.ParamName); }
    }
}
