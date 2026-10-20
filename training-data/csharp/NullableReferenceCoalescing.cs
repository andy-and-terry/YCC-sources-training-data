using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        string? name = null;
        var cache = new Dictionary<string, string>();
        Console.WriteLine(name ?? "anonymous");
        name ??= "guest";
        cache.TryAdd("k", name);
        Console.WriteLine(cache["k"]?.Length);
    }
}
