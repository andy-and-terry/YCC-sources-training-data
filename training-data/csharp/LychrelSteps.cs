using System;
using System.Linq;
using System.Numerics;

// Reverse-and-add until a palindrome; count the steps.
class LychrelSteps
{
    static BigInteger Reverse(BigInteger n) =>
        BigInteger.Parse(new string(n.ToString().Reverse().ToArray()));

    static int Steps(int start)
    {
        BigInteger n = start;
        for (int count = 0; count < 100; count++)
        {
            if (count > 0 && n == Reverse(n)) return count;
            n += Reverse(n);
        }
        return -1;
    }

    static void Main() =>
        Console.WriteLine(string.Join(" ", new[] { 56, 57, 59, 79, 89 }.Select(Steps)));
}
