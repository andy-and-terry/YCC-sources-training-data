using System;
using System.Linq;

class DigitSquareSum
{
    static int Compute(int n) => Math.Abs(n).ToString().Sum(c => (c - '0') * (c - '0'));

    static void Main()
    {
        Console.WriteLine(Compute(123));
        Console.WriteLine(Compute(-99));
    }
}
