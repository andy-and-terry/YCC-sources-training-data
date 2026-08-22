using System;
using System.Linq;

class IsAnagram
{
    static bool Anagram(string a, string b)
    {
        string Normalize(string s) => new string(s.Where(c => !char.IsWhiteSpace(c)).ToArray()).ToLower().OrderBy(c => c).Aggregate("", (acc, c) => acc + c);
        return Normalize(a) == Normalize(b);
    }

    static void Main()
    {
        Console.WriteLine(Anagram("listen", "silent"));
        Console.WriteLine(Anagram("hello", "world"));
    }
}
