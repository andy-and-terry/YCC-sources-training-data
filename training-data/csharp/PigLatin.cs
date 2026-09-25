using System;
using System.Linq;
using System.Text.RegularExpressions;

class PigLatin
{
    static readonly Regex Word = new(@"^(qu|[^aeiou]*)(.*)$", RegexOptions.IgnoreCase);

    static string Translate(string w)
    {
        var m = Word.Match(w);
        string head = m.Groups[1].Value, rest = m.Groups[2].Value;
        if (head.Length == 0) return w + "way";
        if (rest.Length == 0) return w + "ay";
        return rest + head + "ay";
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", "the quick brown fox jumps over the lazy dog".Split(' ').Select(Translate)));
    }
}
