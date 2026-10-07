using System;
using System.Linq;
using System.Text.RegularExpressions;

public static class Acronym
{
    public static string Abbreviate(string phrase) =>
        string.Concat(Regex.Matches(phrase, "[A-Za-z][A-Za-z']*").Select(m => char.ToUpperInvariant(m.Value[0])));

    public static void Main()
    {
        Console.WriteLine(Abbreviate("Portable Network Graphics"));
        Console.WriteLine(Abbreviate("Complementary metal-oxide semiconductor"));
    }
}
