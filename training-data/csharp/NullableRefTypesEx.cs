#nullable enable
using System;

class Program
{
    static string? Find(string[] xs, string key) => Array.Find(xs, x => x.StartsWith(key));

    static void Main()
    {
        var r = Find(new[] { "alpha", "beta" }, "b");
        Console.WriteLine(r?.ToUpper() ?? "none");
        Console.WriteLine(Find(new[] { "alpha" }, "z")?.Length ?? -1);
    }
}
