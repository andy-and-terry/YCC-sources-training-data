using System;
using System.Collections.Generic;
using System.Threading.Tasks;

class ValueTaskDemo
{
    private static readonly Dictionary<int, string> cache = new();

    static ValueTask<string> GetValueAsync(int key)
    {
        if (cache.TryGetValue(key, out var cached))
        {
            return new ValueTask<string>(cached);
        }
        return new ValueTask<string>(LoadAsync(key));
    }

    static async Task<string> LoadAsync(int key)
    {
        await Task.Delay(10);
        var value = $"value-{key}";
        cache[key] = value;
        return value;
    }

    static async Task Main()
    {
        Console.WriteLine(await GetValueAsync(1));
        Console.WriteLine(await GetValueAsync(1));
        Console.WriteLine(await GetValueAsync(2));
    }
}
