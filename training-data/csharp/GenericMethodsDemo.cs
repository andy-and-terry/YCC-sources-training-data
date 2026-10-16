using System;
using System.Collections.Generic;

class GenericMethodsDemo
{
    static void Swap<T>(ref T a, ref T b) => (a, b) = (b, a);

    static T MaxOf<T>(IEnumerable<T> items) where T : IComparable<T>
    {
        using var e = items.GetEnumerator();
        if (!e.MoveNext()) throw new InvalidOperationException("empty");
        T best = e.Current;
        while (e.MoveNext())
            if (e.Current.CompareTo(best) > 0) best = e.Current;
        return best;
    }

    static Dictionary<K, List<V>> GroupBy<K, V>(IEnumerable<V> items, Func<V, K> key) where K : notnull
    {
        var result = new Dictionary<K, List<V>>();
        foreach (var item in items)
        {
            var k = key(item);
            if (!result.TryGetValue(k, out var list)) result[k] = list = new List<V>();
            list.Add(item);
        }
        return result;
    }

    static void Main()
    {
        string x = "left", y = "right";
        Swap(ref x, ref y);
        Console.WriteLine($"{x} {y}");
        Console.WriteLine(MaxOf(new[] { 3, 9, 4 }));
        Console.WriteLine(MaxOf(new[] { "pear", "zebra", "apple" }));
        foreach (var (k, v) in GroupBy(new[] { "a", "bb", "cc", "d" }, s => s.Length))
            Console.WriteLine($"{k}: {string.Join(",", v)}");
    }
}
