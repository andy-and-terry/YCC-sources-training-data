using System;
using System.Linq;

class LinqLookupToDictionary
{
    static void Main()
    {
        string[] words = { "apple", "avocado", "banana", "blueberry", "cherry" };

        var lookup = words.ToLookup(w => w[0]);
        Console.WriteLine(string.Join(",", lookup['b']));
        Console.WriteLine(lookup['z'].Any());
        Console.WriteLine(lookup.Count);

        var lengths = words.ToDictionary(w => w, w => w.Length);
        Console.WriteLine(lengths["banana"]);

        var byLetter = words.GroupBy(w => w[0])
                            .ToDictionary(g => g.Key, g => g.Count());
        foreach (var kv in byLetter.OrderBy(k => k.Key))
            Console.WriteLine($"{kv.Key}: {kv.Value}");

        Console.WriteLine(words.ToHashSet().Contains("cherry"));
    }
}
