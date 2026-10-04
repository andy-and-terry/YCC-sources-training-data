using System;
using System.Collections.Generic;

class LocalFunctionsDemo
{
    static IEnumerable<int> Take(int[] data, int count)
    {
        if (data == null) throw new ArgumentNullException(nameof(data));
        return Iterate();

        IEnumerable<int> Iterate()
        {
            for (int i = 0; i < count && i < data.Length; i++)
                yield return data[i];
        }
    }

    static long Factorial(int n)
    {
        return Go(n, 1);
        static long Go(int k, long acc) => k <= 1 ? acc : Go(k - 1, acc * k);
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Take(new[] { 1, 2, 3, 4 }, 3)));
        Console.WriteLine(Factorial(10));
    }
}
