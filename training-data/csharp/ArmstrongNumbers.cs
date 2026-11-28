using System;
using System.Linq;

static class ArmstrongNumbers
{
    static bool IsArmstrong(int n)
    {
        string s = n.ToString();
        return s.Sum(c => (long)Math.Pow(c - '0', s.Length)) == n;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 999).Where(IsArmstrong)));
        // 1 2 3 4 5 6 7 8 9 153 370 371 407
    }
}
