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

        foreach (var key in new[] { "apple", "pear", "kiwi" })
        {
            if (stock.TryGetValue(key, out var qty))
                Console.WriteLine($"{key}: {qty}");
            else
                Console.WriteLine($"{key}: not stocked");
        }

        Console.WriteLine(stock.GetValueOrDefault("kiwi", -1));
        Console.WriteLine(stock.TryAdd("apple", 9));
        Console.WriteLine(stock.TryAdd("fig", 2));
        Console.WriteLine(stock.Count);
    }
}
