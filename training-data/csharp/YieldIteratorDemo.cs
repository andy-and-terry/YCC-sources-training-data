using System;
using System.Collections.Generic;

class YieldIteratorDemo
{
    static IEnumerable<int> Fibonacci(int count)
    {
        int a = 0, b = 1;
        for (int i = 0; i < count; i++)
        {
            yield return a;
            (a, b) = (b, a + b);
        }
    }

    static IEnumerable<int> EvenSquares(IEnumerable<int> numbers)
    {
        foreach (int n in numbers)
        {
            if (n % 2 == 0) yield return n * n;
        }
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Fibonacci(8)));
        Console.WriteLine(string.Join(" ", EvenSquares(new[] { 1, 2, 3, 4, 5, 6 })));
    }
}
