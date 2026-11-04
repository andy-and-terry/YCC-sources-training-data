using System;
using System.Linq;

class GcdOfArray
{
    static int Gcd(int a, int b) => b == 0 ? Math.Abs(a) : Gcd(b, a % b);

    static int GcdAll(params int[] nums) => nums.Aggregate(0, Gcd);

    static void Main()
    {
        Console.WriteLine(GcdAll(12, 18, 24));
        Console.WriteLine(GcdAll(7, 13));
    }
}
