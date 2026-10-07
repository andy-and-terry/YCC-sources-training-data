using System;
using System.Collections.Concurrent;
using System.Threading.Tasks;

class ConcurrentDictionaryDemo
{
    static void Main()
    {
        var counts = new ConcurrentDictionary<string, int>();
        string[] words = { "a", "b", "a", "c", "b", "a" };

        Parallel.ForEach(words, w =>
            counts.AddOrUpdate(w, 1, (_, old) => old + 1));

        foreach (var key in new[] { "a", "b", "c" })
            Console.WriteLine($"{key}={counts[key]}");

        int v = counts.GetOrAdd("d", 42);
        Console.WriteLine(v);
        Console.WriteLine(counts.TryRemove("d", out var removed) ? removed : -1);
    }
}
