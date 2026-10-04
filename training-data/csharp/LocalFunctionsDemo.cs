using System;
using System.Collections.Generic;

class LocalFunctionsDemo
{
    static IEnumerable<int> Fibonacci(int count)
    {
        if (count < 0) throw new ArgumentOutOfRangeException(nameof(count));
        return Generate();

        IEnumerable<int> Generate()
        {
            int a = 0, b = 1;
            for (int i = 0; i < count; i++)
            {
                yield return a;
                (a, b) = (b, a + b);
            }
        }
    }

    static int Factorial(int n)
    {
        return Fact(n, 1);

        static int Fact(int k, int acc) => k <= 1 ? acc : Fact(k - 1, acc * k);
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Fibonacci(10)));
        Console.WriteLine(Factorial(6));

        try { Fibonacci(-1); }
        catch (ArgumentOutOfRangeException e) { Console.WriteLine("eager validation: " + e.ParamName); }
    }
}
