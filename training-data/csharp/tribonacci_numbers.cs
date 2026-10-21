using System;
using System.Collections.Generic;

// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
class TribonacciNumbers
{
    static IEnumerable<long> Tribonacci(int count)
    {
        long a = 0, b = 0, c = 1;
        for (int i = 0; i < count; i++)
        {
            yield return a;
            (a, b, c) = (b, c, a + b + c);
        }
    }

    static void Main()
    {
        Console.WriteLine("Tribonacci: " + string.Join(", ", Tribonacci(15)));
    }
}
