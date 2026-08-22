using System;
using System.Linq;

class ReverseString
{
    static string Reverse(string s) => new string(s.Reverse().ToArray());

    static void Main()
    {
        Console.WriteLine(Reverse("hello"));
    }
}
