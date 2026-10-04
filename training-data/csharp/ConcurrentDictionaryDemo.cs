using System;
using System.Collections.Concurrent;
using System.Threading.Tasks;

class ConcurrentDictionaryDemo
{
    static void Main()
    {
        var counts = new ConcurrentDictionary<string, int>();
        string[] words = { "a", "b", "a", "c", "b", "a" };

        Parallel.For(0, 1000, i =>
        {
            var w = words[i % words.Length];
            counts.AddOrUpdate(w, 1, (_, old) => old + 1);
        });

        foreach (var kv in counts)
            Console.WriteLine($"{kv.Key}: {kv.Value}");

        var v = counts.GetOrAdd("z", 0);
        Console.WriteLine($"z: {v}, TryRemove: {counts.TryRemove("z", out _)}");
    }
}
