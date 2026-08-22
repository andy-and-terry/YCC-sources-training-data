using System;
using System.Collections.Generic;
using System.Linq;

class KruskalUnionFind
{
    private readonly int[] parent;

    public KruskalUnionFind(int size)
    {
        parent = new int[size];
        for (int i = 0; i < size; i++) parent[i] = i;
    }

    public int Find(int x)
    {
        while (parent[x] != x) x = parent[x];
        return x;
    }

    public bool Union(int a, int b)
    {
        int rootA = Find(a), rootB = Find(b);
        if (rootA == rootB) return false;
        parent[rootA] = rootB;
        return true;
    }
}

class KruskalMst
{
    static List<(int, int, int)> Kruskal(int numNodes, (int, int, int)[] edges)
    {
        var sorted = edges.OrderBy(e => e.Item3).ToList();
        var uf = new KruskalUnionFind(numNodes);
        var mst = new List<(int, int, int)>();
        foreach (var e in sorted)
            if (uf.Union(e.Item1, e.Item2)) mst.Add(e);
        return mst;
    }

    static void Main()
    {
        var edges = new[] { (0, 1, 1), (0, 2, 3), (1, 2, 4), (1, 3, 2), (2, 3, 5) };
        foreach (var (u, v, w) in Kruskal(4, edges)) Console.WriteLine($"{u}-{v}:{w}");
    }
}
