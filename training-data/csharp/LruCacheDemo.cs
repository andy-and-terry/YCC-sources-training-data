using System;
using System.Collections.Generic;

class LruCache<TKey, TValue> where TKey : notnull
{
    private readonly int capacity;
    private readonly Dictionary<TKey, LinkedListNode<(TKey Key, TValue Value)>> map = new();
    private readonly LinkedList<(TKey Key, TValue Value)> order = new();

    public LruCache(int capacity) => this.capacity = capacity;

    public bool TryGet(TKey key, out TValue? value)
    {
        if (map.TryGetValue(key, out var node))
        {
            order.Remove(node);
            order.AddFirst(node);
            value = node.Value.Value;
            return true;
        }
        value = default;
        return false;
    }

    public void Put(TKey key, TValue value)
    {
        if (map.TryGetValue(key, out var existing))
        {
            order.Remove(existing);
        }
        else if (map.Count >= capacity)
        {
            var lru = order.Last!;
            order.RemoveLast();
            map.Remove(lru.Value.Key);
        }

        var node = new LinkedListNode<(TKey, TValue)>((key, value));
        order.AddFirst(node);
        map[key] = node;
    }

    static void Main()
    {
        var cache = new LruCache<int, string>(2);
        cache.Put(1, "a");
        cache.Put(2, "b");
        cache.TryGet(1, out var v1);
        Console.WriteLine(v1);
        cache.Put(3, "c");
        Console.WriteLine(cache.TryGet(2, out _));
        cache.TryGet(3, out var v3);
        Console.WriteLine(v3);
    }
}
