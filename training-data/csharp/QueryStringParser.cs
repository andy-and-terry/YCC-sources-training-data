using System;
using System.Collections.Generic;
using System.Linq;

class QueryStringParser
{
    static Dictionary<string, List<string>> Parse(string qs)
    {
        var result = new Dictionary<string, List<string>>();
        foreach (var pair in qs.TrimStart('?').Split('&', StringSplitOptions.RemoveEmptyEntries))
        {
            int eq = pair.IndexOf('=');
            string key = Decode(eq < 0 ? pair : pair[..eq]);
            string value = eq < 0 ? "" : Decode(pair[(eq + 1)..]);
            if (!result.TryGetValue(key, out var list)) result[key] = list = new List<string>();
            list.Add(value);
        }
        return result;
    }

    static string Decode(string s) => Uri.UnescapeDataString(s.Replace('+', ' '));

    static string Build(Dictionary<string, List<string>> q) =>
        string.Join("&", q.SelectMany(kv => kv.Value.Select(v => $"{Uri.EscapeDataString(kv.Key)}={Uri.EscapeDataString(v)}")));

    static void Main()
    {
        var q = Parse("?name=J%C3%BCrgen+M&tag=a&tag=b&empty=");
        foreach (var (k, v) in q) Console.WriteLine($"{k} = [{string.Join(", ", v)}]");
        Console.WriteLine(Build(q));
    }
}
