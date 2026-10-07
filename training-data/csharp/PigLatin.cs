using System;
using System.Linq;
using System.Text.RegularExpressions;

public static class PigLatin
{
    static readonly Regex Vowel = new(@"^([aeiou]|xr|yt)");
    static readonly Regex Consonant = new(@"^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$");

    public static string Word(string w)
    {
        if (Vowel.IsMatch(w)) return w + "ay";
        var m = Consonant.Match(w);
        return m.Success ? m.Groups[2].Value + m.Groups[1].Value + "ay" : w + "ay";
    }

    public static string Translate(string s) =>
        string.Join(" ", s.ToLowerInvariant().Split(' ', StringSplitOptions.RemoveEmptyEntries).Select(Word));

    public static void Main() => Console.WriteLine(Translate("quick fast run apple rhythm square"));
}
