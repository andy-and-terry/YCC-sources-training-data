using System;
using System.Linq;

class Rot47Cipher
{
    static string Rot47(string s) =>
        new string(s.Select(c => c >= 33 && c <= 126 ? (char)(33 + (c - 33 + 47) % 94) : c).ToArray());

    static void Main()
    {
        var e = Rot47("Hello, World!");
        Console.WriteLine($"{e} {Rot47(e)}");
    }
}
