using System;
using System.Linq;

class Rot13
{
    static string RotN(string s, int n)
    {
        int k = ((n % 26) + 26) % 26;
        return string.Concat(s.Select(c => c switch
        {
            >= 'a' and <= 'z' => (char)('a' + (c - 'a' + k) % 26),
            >= 'A' and <= 'Z' => (char)('A' + (c - 'A' + k) % 26),
            _ => c,
        }));
    }

    static void Main(string[] args)
    {
        if (args.Length > 0 && args[0] == "-")
        {
            string? line;
            while ((line = Console.ReadLine()) != null) Console.WriteLine(RotN(line, 13));
            return;
        }
        const string text = "Why did the chicken cross the road?";
        Console.WriteLine(RotN(text, 13));
        Console.WriteLine($"{RotN(RotN(text, 13), 13) == text} {RotN(RotN(text, 3), -3) == text}");
    }
}
