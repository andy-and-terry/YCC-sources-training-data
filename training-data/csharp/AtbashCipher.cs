using System;
using System.Linq;

class AtbashCipher
{
    static string Apply(string s) => string.Concat(s.Select(c => c switch
    {
        >= 'a' and <= 'z' => (char)('z' - (c - 'a')),
        >= 'A' and <= 'Z' => (char)('Z' - (c - 'A')),
        _ => c,
    }));

    static void Main()
    {
        string enc = Apply("Hello, World!");
        Console.WriteLine($"{enc} | {Apply(enc)}");
    }
}
