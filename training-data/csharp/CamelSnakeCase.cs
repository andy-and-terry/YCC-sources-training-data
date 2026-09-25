using System;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;

class CamelSnakeCase
{
    static string[] Words(string s)
    {
        s = Regex.Replace(s, "([A-Z]+)([A-Z][a-z])", "$1 $2");
        s = Regex.Replace(s, "([a-z0-9])([A-Z])", "$1 $2");
        return s.Split(new[] { ' ', '_', '-' }, StringSplitOptions.RemoveEmptyEntries).Select(w => w.ToLowerInvariant()).ToArray();
    }

    static string Cap(string w) => w.Length == 0 ? w : char.ToUpperInvariant(w[0]) + w[1..];

    static string ToCamel(string s) => string.Concat(Words(s).Select((w, i) => i == 0 ? w : Cap(w)));
    static string ToPascal(string s) => string.Concat(Words(s).Select(Cap));
    static string ToSnake(string s) => string.Join("_", Words(s));
    static string ToKebab(string s) => string.Join("-", Words(s));
    static string ToTitle(string s) => CultureInfo.InvariantCulture.TextInfo.ToTitleCase(string.Join(" ", Words(s)));

    static void Main()
    {
        foreach (var s in new[] { "parseHTTPResponse", "user_id", "background-color", "XMLHttpRequest" })
            Console.WriteLine($"{s,-18} {ToCamel(s),-18} {ToPascal(s),-18} {ToSnake(s),-20} {ToKebab(s),-20} {ToTitle(s)}");
    }
}
