#nullable enable
using System;
using System.Collections.Generic;

class UserLookup
{
    private readonly Dictionary<int, string> users = new();

    public void Add(int id, string name) => users[id] = name;

    public string? Find(int id) => users.TryGetValue(id, out var name) ? name : null;

    static void Main()
    {
        var lookup = new UserLookup();
        lookup.Add(1, "Alice");

        string? found = lookup.Find(1);
        Console.WriteLine(found?.ToUpper() ?? "UNKNOWN");

        string? missing = lookup.Find(999);
        Console.WriteLine(missing?.ToUpper() ?? "UNKNOWN");
    }
}
