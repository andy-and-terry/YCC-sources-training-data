using System;
using System.Collections.Generic;
using System.Linq;

class LfuCache<TKey, TValue> where TKey : notnull
{
    private readonly int capacity;
    private readonly Dictionary<TKey, TValue> values = new();
    private readonly Dictionary<TKey, int> freq = new();

    public LfuCache(int capacity) => this.capacity = capacity;

    public bool TryGet(TKey key, out TValue? value)
    {
        if (values.TryGetValue(key, out var v))
        {
            freq[key]++;
            value = v;
            return true;
        }
        value = default;
        return false;
    }

    public void Put(TKey key, TValue value)
    {
        if (capacity == 0) return;

        if (values.ContainsKey(key))
        {
            values[key] = value;
            freq[key]++;
            return;
        }

        if (values.Count >= capacity)
        {
            var evictKey = freq.OrderBy(kv => kv.Value).First().Key;
            values.Remove(evictKey);
            freq.Remove(evictKey);
        }

        values[key] = value;
        freq[key] = 1;
    }

    static void Main()
    {
        var cache = new LfuCache<int, string>(2);
        cache.Put(1, "a");
        cache.Put(2, "b");
        cache.TryGet(1, out _);
        cache.Put(3, "c");
        Console.WriteLine(cache.TryGet(2, out _));
        cache.TryGet(1, out var v1);
        Console.WriteLine(v1);
    }
}
