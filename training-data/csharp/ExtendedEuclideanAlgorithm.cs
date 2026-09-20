using System;

class ExtendedEuclideanAlgorithm
{
    static long ExtGcd(long a, long b, out long x, out long y)
    {
        if (b == 0)
        {
            x = 1;
            y = 0;
            return a;
        }

        long gcd = ExtGcd(b, a % b, out long x1, out long y1);
        x = y1;
        y = x1 - (a / b) * y1;
        return gcd;
    }

    static void Main()
    {
        long a = 240, b = 46;
        long gcd = ExtGcd(a, b, out long x, out long y);
        Console.WriteLine($"gcd({a}, {b}) = {gcd}");
        Console.WriteLine($"{a}*{x} + {b}*{y} = {a * x + b * y}");
    }
}
