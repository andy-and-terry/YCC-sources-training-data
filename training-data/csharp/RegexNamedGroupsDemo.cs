using System;
using System.Text.RegularExpressions;

class RegexNamedGroupsDemo
{
    static void Main()
    {
        var pattern = new Regex(@"(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})");
        var m = pattern.Match("Released on 2024-03-15.");

        if (m.Success)
        {
            Console.WriteLine($"Year={m.Groups["year"].Value}");
            Console.WriteLine($"Month={m.Groups["month"].Value}");
            Console.WriteLine($"Day={m.Groups["day"].Value}");
        }

        string swapped = pattern.Replace("2024-03-15", "${day}/${month}/${year}");
        Console.WriteLine(swapped);

        foreach (Match w in Regex.Matches("a1 b22 c333", @"[a-z](\d+)"))
            Console.WriteLine($"{w.Value} -> {w.Groups[1].Length} digits");

        Console.WriteLine(Regex.IsMatch("user@example.com", @"^[\w.]+@[\w.]+\.\w+$"));
    }
}
