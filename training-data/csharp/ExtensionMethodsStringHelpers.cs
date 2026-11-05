using System;
using System.Linq;

static class StringExt
{
    public static string Reverse(this string s) => new string(s.Reverse<char>().ToArray());
    public static bool IsPalindrome(this string s) => s == s.Reverse();
}

class Program
{
    static void Main()
    {
        Console.WriteLine("level".IsPalindrome());
        Console.WriteLine("hello".Reverse());
    }
}
