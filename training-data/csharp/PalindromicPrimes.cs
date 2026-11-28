using System;
using System.Linq;

static class PalindromicPrimes
{
    static bool IsPrime(int n) => n >= 2 && Enumerable.Range(2, (int)Math.Sqrt(n) - 1).All(d => n % d != 0);

    static bool IsPalindrome(int n)
    {
        string s = n.ToString();
        return s.SequenceEqual(s.Reverse());
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(2, 198).Where(n => IsPalindrome(n) && IsPrime(n))));
        // 2 3 5 7 11 101 131 151 181 191
    }
}
