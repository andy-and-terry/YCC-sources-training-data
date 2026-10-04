using System;
using System.Collections.Generic;

class NullCoalescingDemo
{
    class Config
    {
        public string? Name { get; set; }
        public List<string>? Tags { get; set; }
    }

    static void Main()
    {
        var config = new Config();
        Console.WriteLine(config.Name ?? "default");

        config.Name ??= "generated";
        Console.WriteLine(config.Name);

        config.Tags ??= new List<string>();
        config.Tags.Add("one");
        Console.WriteLine(config.Tags.Count);

        Config? missing = null;
        Console.WriteLine(missing?.Name ?? "no config");
        Console.WriteLine(missing?.Tags?.Count ?? -1);
        Console.WriteLine(missing?.Name?.Length.ToString() ?? "n/a");
    }
}
