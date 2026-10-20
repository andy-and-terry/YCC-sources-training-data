using System;
using System.Text.RegularExpressions;

class RegexNamedGroupsReplace
{
    static void Main()
    {
        var m = Regex.Match("order #123 on 2024-05-06", @"#(?<id>\d+).*?(?<y>\d{4})-(?<m>\d\d)");
        Console.WriteLine($"{m.Groups["id"]} {m.Groups["y"]} {m.Groups["m"].Value}");
        Console.WriteLine(Regex.Replace("a1b22", @"\d+", x => (int.Parse(x.Value) * 2).ToString()));
        foreach (Match x in Regex.Matches("cat bat rat", @"\b(\w)at\b")) Console.Write(x.Groups[1] + " ");
        Console.WriteLine();
        Console.WriteLine(Regex.IsMatch("abc", "^[a-c]+$") + " " + string.Join("|", Regex.Split("a, b;c", @"[,;]\s*")));
    }
}
