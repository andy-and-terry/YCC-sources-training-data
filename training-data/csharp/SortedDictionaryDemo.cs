using System;
using System.Collections.Generic;
using System.Linq;

class SortedDictionaryDemo
{
    static void Main()
    {
        var scores = new SortedDictionary<string, int>
        {
            ["mallory"] = 70, ["alice"] = 95, ["trent"] = 60, ["bob"] = 82
        };

        foreach (var (name, score) in scores)
            Console.WriteLine($"{name,-8}{score}");

        Console.WriteLine(scores.Keys.First() + " " + scores.Keys.Last());

        var sl = new SortedList<int, string> { [30] = "c", [10] = "a", [20] = "b" };
        Console.WriteLine(string.Join(",", sl.Values));
        Console.WriteLine(sl.IndexOfKey(20));
        Console.WriteLine(sl.GetValueAtIndex(2));
    }
}
