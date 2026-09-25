using System;
using System.Linq;

class ArmstrongNumber
{
    static bool IsArmstrong(long n)
    {
        string digits = n.ToString();
        return digits.Sum(c => (long)Math.Pow(c - '0', digits.Length)) == n;
    }

    static void Main()
    {
        var found = Enumerable.Range(1, 9_999_999).Where(n => IsArmstrong(n));
        Console.WriteLine(string.Join(" ", found));
    }
}
