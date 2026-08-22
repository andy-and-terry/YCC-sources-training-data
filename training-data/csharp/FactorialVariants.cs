using System;
using System.Linq;

class FactorialVariants
{
    static long Recursive(int n) => n <= 1 ? 1 : n * Recursive(n - 1);

    static long Iterative(int n)
    {
        long result = 1;
        for (int i = 2; i <= n; i++) result *= i;
        return result;
    }

    static void Main()
    {
        Console.WriteLine($"{Recursive(5)} {Iterative(5)}");
    }
}
