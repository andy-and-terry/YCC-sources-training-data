using System;
using System.Collections.Generic;

class DictionaryTryGetCollections
{
    static void Main()
    {
        var d = new Dictionary<string, int> { ["a"] = 1, ["b"] = 2 };
        if (d.TryGetValue("a", out var v)) Console.WriteLine(v);
        d.TryAdd("a", 99); d[ "c"] = 3;
        Console.WriteLine(d.GetValueOrDefault("zzz", -1) + " " + d.Count);
        var set = new HashSet<int> { 1, 2, 3 }; set.IntersectWith(new[] { 2, 3, 4 });
        Console.WriteLine(string.Join(",", set));
        var sd = new SortedDictionary<int, string> { [3] = "c", [1] = "a" };
        Console.WriteLine(string.Join(",", sd.Keys));
        var pq = new PriorityQueue<string, int>(); pq.Enqueue("low", 5); pq.Enqueue("high", 1);
        Console.WriteLine(pq.Dequeue());
        var ll = new LinkedList<int>(new[] { 1, 2 }); ll.AddFirst(0);
        Console.WriteLine(string.Join(",", ll));
    }
}
