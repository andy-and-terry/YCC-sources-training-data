using System;

class Lcm
{
    static long Gcd(long a, long b) => b == 0 ? a : Gcd(b, a % b);

    static long LeastCommonMultiple(long a, long b) => a / Gcd(a, b) * b;

    static void Main()
    {
        Console.WriteLine(LeastCommonMultiple(4, 6));
        Console.WriteLine(LeastCommonMultiple(21, 6));
        Console.WriteLine(LeastCommonMultiple(8, 12));
    }
}
