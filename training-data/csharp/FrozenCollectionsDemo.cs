using System;
using System.Collections.Frozen;
using System.Collections.Generic;

// FrozenDictionary / FrozenSet (.NET 8) are immutable collections
// optimized for fast reads after a one-time creation cost.
class Program
{
    static readonly FrozenSet<string> Keywords =
        new[] { "if", "else", "while", "for", "return" }.ToFrozenSet();

    static readonly FrozenDictionary<string, int> HttpCodes =
        new Dictionary<string, int>
        {
            ["OK"] = 200,
            ["NotFound"] = 404,
            ["ServerError"] = 500,
        }.ToFrozenDictionary();

    static void Main()
    {
        Console.WriteLine(Keywords.Contains("while"));
        Console.WriteLine(Keywords.Contains("foreach"));
        Console.WriteLine(Keywords.Count);

        Console.WriteLine(HttpCodes["NotFound"]);
        Console.WriteLine(HttpCodes.TryGetValue("Teapot", out var code) ? code : -1);

        foreach (var (name, value) in HttpCodes)
            Console.WriteLine($"{name}={value}");

        // Case-insensitive lookup chosen at creation time
        var ci = new[] { "Red", "Green" }.ToFrozenSet(StringComparer.OrdinalIgnoreCase);
        Console.WriteLine(ci.Contains("RED"));
    }
}
