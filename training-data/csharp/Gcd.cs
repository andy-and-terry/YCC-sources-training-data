using System;

class Gcd
{
    static int Compute(int a, int b)
    {
        while (b != 0)
        {
            (a, b) = (b, a % b);
        }
        return Math.Abs(a);
    }

    static void Main()
    {
        Console.WriteLine(Compute(48, 18));
    }
}
