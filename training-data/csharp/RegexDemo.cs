using System;
using System.Text.RegularExpressions;

class RegexDemo
{
    static void Main()
    {
        var date = new Regex(@"(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})");
        var m = date.Match("Released on 2024-03-15.");
        if (m.Success)
            Console.WriteLine($"{m.Groups["day"]}/{m.Groups["month"]}/{m.Groups["year"]}");

        foreach (Match w in Regex.Matches("cat bat rat", @"\b[a-z]at\b"))
            Console.WriteLine(w.Value);

        Console.WriteLine(Regex.Replace("a  b   c", @"\s+", " "));
        Console.WriteLine(Regex.IsMatch("user@example.com", @"^[^@\s]+@[^@\s]+\.\w+$"));
        Console.WriteLine(string.Join("|", Regex.Split("one1two22three", @"\d+")));
    }
}
