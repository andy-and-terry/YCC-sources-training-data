using System;
using System.Linq;
using System.Collections.Concurrent;
using System.Threading.Tasks;

class ConcurrentDictionaryDemo
{
    static void Main()
    {
        var counts = new ConcurrentDictionary<string, int>();
        string[] words = { "red", "green", "red", "blue", "green", "red" };

        Parallel.ForEach(words, w =>
            counts.AddOrUpdate(w, 1, (_, old) => old + 1));

        foreach (var kv in counts.OrderBy(k => k.Key))
            Console.WriteLine($"{kv.Key}: {kv.Value}");

        int v = counts.GetOrAdd("yellow", 0);
        Console.WriteLine(v);
        Console.WriteLine(counts.TryRemove("blue", out var removed) ? $"removed {removed}" : "missing");
        Console.WriteLine(counts.TryGetValue("blue", out _));
    }
}
