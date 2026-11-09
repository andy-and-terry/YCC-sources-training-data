#nullable enable
using System;

class Program {
    static string? Find(string[] xs, string key) =>
        Array.Find(xs, x => x == key);

    static void Main() {
        var r = Find(new[] { "a", "b" }, "z");
        Console.WriteLine(r?.ToUpper() ?? "not found");
    }
}
