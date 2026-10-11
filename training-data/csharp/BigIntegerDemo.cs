using System;
using System.Numerics;

class BigIntegerDemo
{
    static BigInteger Factorial(int n)
    {
        BigInteger r = BigInteger.One;
        for (int i = 2; i <= n; i++) r *= i;
        return r;
    }

    static void Main()
    {
        Console.WriteLine(Factorial(30));
        Console.WriteLine(Factorial(50).ToString().Length);
        Console.WriteLine(BigInteger.Pow(2, 100));
        var a = BigInteger.Parse("123456789012345678901234567890");
        Console.WriteLine(a * a);
        Console.WriteLine(BigInteger.DivRem(a, 97, out var rem) + " rem " + rem);
        Console.WriteLine(BigInteger.GreatestCommonDivisor(Factorial(10), Factorial(8)));
        Console.WriteLine(BigInteger.ModPow(3, 1000, 1_000_000_007));
        Console.WriteLine((a % 2).IsZero + " " + a.Sign);
    }
}
