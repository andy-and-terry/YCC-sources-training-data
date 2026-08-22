using System;
using System.Collections.Generic;

class DisjointSet
{
    private readonly Dictionary<string, string> parent = new();
    private readonly Dictionary<string, int> size = new();

    public DisjointSet(IEnumerable<string> elements)
    {
        foreach (var e in elements)
        {
            parent[e] = e;
            size[e] = 1;
        }
    }

    public string Find(string x)
    {
        while (parent[x] != x)
        {
            parent[x] = parent[parent[x]];
            x = parent[x];
        }
        return x;
    }

    public void Union(string a, string b)
    {
        var rootA = Find(a);
        var rootB = Find(b);
        if (rootA == rootB) return;
        if (size[rootA] < size[rootB]) (rootA, rootB) = (rootB, rootA);
        parent[rootB] = rootA;
        size[rootA] += size[rootB];
    }

    public bool Connected(string a, string b) => Find(a) == Find(b);

    static void Main()
    {
        var ds = new DisjointSet(new[] { "a", "b", "c", "d" });
        ds.Union("a", "b");
        ds.Union("b", "c");
        Console.WriteLine($"{ds.Connected("a", "c")} {ds.Connected("a", "d")}");
    }
}
