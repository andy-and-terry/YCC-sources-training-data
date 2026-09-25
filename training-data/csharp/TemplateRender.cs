using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text.RegularExpressions;

class TemplateRender
{
    static readonly Regex Token = new(@"\{\{\s*([\w.]+)\s*(?:\|\s*(\w+)\s*)?\}\}");

    static readonly Dictionary<string, Func<string, string>> Filters = new()
    {
        ["upper"] = s => s.ToUpperInvariant(),
        ["lower"] = s => s.ToLowerInvariant(),
        ["title"] = s => CultureInfo.InvariantCulture.TextInfo.ToTitleCase(s),
        ["trim"] = s => s.Trim(),
    };

    static string Render(string template, IReadOnlyDictionary<string, object> ctx) =>
        Token.Replace(template, m =>
        {
            object? cur = ctx;
            foreach (var part in m.Groups[1].Value.Split('.'))
                cur = cur is IReadOnlyDictionary<string, object> d && d.TryGetValue(part, out var v) ? v : null;
            string value = cur?.ToString() ?? "";
            return m.Groups[2].Success ? Filters[m.Groups[2].Value](value) : value;
        });

    static void Main()
    {
        var ctx = new Dictionary<string, object>
        {
            ["user"] = new Dictionary<string, object> { ["name"] = "ada lovelace" },
            ["count"] = 3,
            ["kind"] = "messages",
        };
        Console.WriteLine(Render("Hello {{ user.name | title }}, you have {{count}} new {{ kind|upper }}.", ctx));
    }
}
