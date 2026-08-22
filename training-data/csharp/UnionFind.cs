using System;

class UnionFind
{
    private readonly int[] parent;
    private readonly int[] rank;

    public UnionFind(int size)
    {
        parent = new int[size];
        rank = new int[size];
        for (int i = 0; i < size; i++) parent[i] = i;
    }

    public int Find(int x)
    {
        if (parent[x] != x) parent[x] = Find(parent[x]);
        return parent[x];
    }

    public bool Union(int a, int b)
    {
        int rootA = Find(a), rootB = Find(b);
        if (rootA == rootB) return false;
        if (rank[rootA] < rank[rootB]) (rootA, rootB) = (rootB, rootA);
        parent[rootB] = rootA;
        if (rank[rootA] == rank[rootB]) rank[rootA]++;
        return true;
    }

    static void Main()
    {
        var uf = new UnionFind(5);
        uf.Union(0, 1);
        uf.Union(1, 2);
        Console.WriteLine($"{uf.Find(0) == uf.Find(2)} {uf.Find(0) == uf.Find(3)}");
    }
}
