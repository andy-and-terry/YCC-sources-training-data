using System;
using System.Linq;

static class StringExt
{
    public static string Truncate(this string s, int max) =>
        s.Length <= max ? s : s.Substring(0, max) + "...";

    public static bool IsPalindrome(this string s)
    {
        var t = new string(s.Where(char.IsLetterOrDigit).Select(char.ToLower).ToArray());
        return t.SequenceEqual(t.Reverse());
    }
}

class ExtensionMethodsString
{
    static void Main()
    {
        Console.WriteLine("abcdefghij".Truncate(5));
        Console.WriteLine("A man, a plan, a canal: Panama".IsPalindrome());
    }
}
