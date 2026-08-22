using System;
using System.Collections.Generic;

class TopologicalSort
{
    static List<int> Sort(int numNodes, (int, int)[] edges)
    {
        var graph = new List<int>[numNodes];
        var inDegree = new int[numNodes];
        for (int i = 0; i < numNodes; i++) graph[i] = new List<int>();
        foreach (var (u, v) in edges)
        {
            graph[u].Add(v);
            inDegree[v]++;
        }

        var queue = new Queue<int>();
        for (int n = 0; n < numNodes; n++) if (inDegree[n] == 0) queue.Enqueue(n);

        var order = new List<int>();
        while (queue.Count > 0)
        {
            int node = queue.Dequeue();
            order.Add(node);
            foreach (int neighbor in graph[node])
                if (--inDegree[neighbor] == 0) queue.Enqueue(neighbor);
        }

        if (order.Count != numNodes) throw new InvalidOperationException("graph has a cycle");
        return order;
    }

    static void Main()
    {
        var edges = new[] { (5, 2), (5, 0), (4, 0), (4, 1), (2, 3), (3, 1) };
        Console.WriteLine(string.Join(" ", Sort(6, edges)));
    }
}
