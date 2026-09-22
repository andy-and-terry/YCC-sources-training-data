using System;
using System.Collections.Generic;

class DijkstraShortestPath
{
    static int[] Solve(int numNodes, List<(int To, int Weight)>[] adj, int source)
    {
        var dist = new int[numNodes];
        Array.Fill(dist, int.MaxValue);
        dist[source] = 0;

        var pq = new PriorityQueue<int, int>();
        pq.Enqueue(source, 0);

        while (pq.Count > 0)
        {
            int u = pq.Dequeue();
            foreach (var (v, w) in adj[u])
            {
                int candidate = dist[u] + w;
                if (candidate < dist[v])
                {
                    dist[v] = candidate;
                    pq.Enqueue(v, candidate);
                }
            }
        }

        return dist;
    }

    static void Main()
    {
        var adj = new List<(int, int)>[5];
        for (int i = 0; i < 5; i++) adj[i] = new List<(int, int)>();

        void AddEdge(int u, int v, int w)
        {
            adj[u].Add((v, w));
            adj[v].Add((u, w));
        }

        AddEdge(0, 1, 4);
        AddEdge(0, 2, 1);
        AddEdge(2, 1, 2);
        AddEdge(1, 3, 1);
        AddEdge(2, 3, 5);
        AddEdge(3, 4, 3);

        Console.WriteLine(string.Join(" ", Solve(5, adj, 0)));
    }
}
