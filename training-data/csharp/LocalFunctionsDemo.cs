using System;
using System.Collections.Generic;

class LocalFunctionsDemo
{
    static IEnumerable<int> Range(int start, int count)
    {
        if (count < 0)
            throw new ArgumentOutOfRangeException(nameof(count));
        return Iterate();

        IEnumerable<int> Iterate()
        {
            for (int i = 0; i < count; i++)
                yield return start + i;
        }
    }

    static long Factorial(int n)
    {
        return Loop(n, 1);

        static long Loop(int k, long acc) => k <= 1 ? acc : Loop(k - 1, acc * k);
    }

    static void Main()
    {
        Console.WriteLine(string.Join(",", Range(3, 4)));
        Console.WriteLine(Factorial(10));
        try
        {
            Range(0, -1);
        }
        catch (ArgumentOutOfRangeException ex)
        {
            Console.WriteLine($"Eager validation: {ex.ParamName}");
        }
    }
}
