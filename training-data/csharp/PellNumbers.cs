using System;

class PellNumbers
{
    // P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
    static void Main()
    {
        long a = 0, b = 1;
        for (int i = 0; i < 15; i++)
        {
            Console.WriteLine($"P({i}) = {a}");
            (a, b) = (b, 2 * b + a);
        }
    }
}
