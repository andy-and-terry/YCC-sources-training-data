using System;
using System.Collections.Generic;

class FordFulkersonMaxFlow
{
    static bool Bfs(int[,] residual, int n, int source, int sink, int[] parent)
    {
        var visited = new bool[n];
        var queue = new Queue<int>();
        queue.Enqueue(source);
        visited[source] = true;
        parent[source] = -1;

        while (queue.Count > 0)
        {
            int u = queue.Dequeue();
            for (int v = 0; v < n; v++)
            {
                if (!visited[v] && residual[u, v] > 0)
                {
                    parent[v] = u;
                    if (v == sink) return true;
                    visited[v] = true;
                    queue.Enqueue(v);
                }
            }
        }
        return false;
    }

    static int MaxFlow(int[,] graph, int source, int sink)
    {
        int n = graph.GetLength(0);
        var residual = (int[,])graph.Clone();
        var parent = new int[n];
        int maxFlow = 0;

        while (Bfs(residual, n, source, sink, parent))
        {
            int pathFlow = int.MaxValue;
            for (int v = sink; v != source; v = parent[v])
                pathFlow = Math.Min(pathFlow, residual[parent[v], v]);

            for (int v = sink; v != source; v = parent[v])
            {
                int u = parent[v];
                residual[u, v] -= pathFlow;
                residual[v, u] += pathFlow;
            }

            maxFlow += pathFlow;
        }

        return maxFlow;
    }

    static void Main()
    {
        var graph = new int[,]
        {
            { 0, 16, 13, 0, 0, 0 },
            { 0, 0, 10, 12, 0, 0 },
            { 0, 4, 0, 0, 14, 0 },
            { 0, 0, 9, 0, 0, 20 },
            { 0, 0, 0, 7, 0, 4 },
            { 0, 0, 0, 0, 0, 0 },
        };
        Console.WriteLine(MaxFlow(graph, 0, 5));
    }
}
