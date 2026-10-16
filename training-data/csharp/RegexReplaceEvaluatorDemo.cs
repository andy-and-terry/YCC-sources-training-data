using System;
using System.Text.RegularExpressions;

class RegexReplaceEvaluatorDemo
{
    static void Main()
    {
        string text = "Prices: 5 apples, 12 pears, 100 figs";

        string doubled = Regex.Replace(text, @"\d+", m => (int.Parse(m.Value) * 2).ToString());
        Console.WriteLine(doubled);

        string snake = Regex.Replace("camelCaseVariableName", "(?<!^)([A-Z])", "_$1").ToLower();
        Console.WriteLine(snake);

        string camel = Regex.Replace("make_it_camel", "_([a-z])", m => m.Groups[1].Value.ToUpper());
        Console.WriteLine(camel);

        string squeezed = Regex.Replace("too    many   spaces", @"\s{2,}", " ");
        Console.WriteLine(squeezed);

        Console.WriteLine(Regex.Replace("2024-03-15", @"(\d+)-(\d+)-(\d+)", "$3/$2/$1"));
        Console.WriteLine(Regex.Split("a1b22c333d", @"\d+").Length);
        Console.WriteLine(Regex.IsMatch("abc123", @"^[a-z]+\d+$"));
    }
}
