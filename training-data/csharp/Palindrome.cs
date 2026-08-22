using System;
using System.Linq;

class Palindrome
{
    static bool IsPalindrome(string s)
    {
        var cleaned = new string(s.ToLower().Where(char.IsLetterOrDigit).ToArray());
        return cleaned == new string(cleaned.Reverse().ToArray());
    }

    static void Main()
    {
        Console.WriteLine(IsPalindrome("A man a plan a canal Panama"));
        Console.WriteLine(IsPalindrome("hello"));
    }
}
