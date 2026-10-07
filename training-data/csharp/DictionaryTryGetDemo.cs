using System;
using System.Collections.Generic;

class DictionaryTryGetDemo
{
    static void Main()
    {
        var stock = new Dictionary<string, int>
        {
            ["apple"] = 5,
            ["pear"] = 0
        };

        if (stock.TryGetValue("apple", out int count))
            Console.WriteLine($"apple: {count}");

        Console.WriteLine(stock.TryGetValue("mango", out _) ? "have mango" : "no mango");

        stock.TryAdd("kiwi", 12);
        stock.TryAdd("apple", 99);
        stock["pear"] += 3;

        foreach (var (name, qty) in stock)
            Console.WriteLine($"{name} = {qty}");

        Console.WriteLine(stock.GetValueOrDefault("grape", -1));
        stock.Remove("pear");
        Console.WriteLine(stock.ContainsKey("pear"));
    }
}
