using System;

class BellmanFord
{
    static int[] Solve(int numNodes, (int, int, int)[] edges, int source)
    {
        var dist = new int[numNodes];
        for (int i = 0; i < numNodes; i++) dist[i] = int.MaxValue;
        dist[source] = 0;

        for (int i = 0; i < numNodes - 1; i++)
        {
            foreach (var (u, v, w) in edges)
                if (dist[u] != int.MaxValue && dist[u] + w < dist[v]) dist[v] = dist[u] + w;
        }

        foreach (var (u, v, w) in edges)
            if (dist[u] != int.MaxValue && dist[u] + w < dist[v])
                throw new InvalidOperationException("graph contains a negative-weight cycle");

        return dist;
    }

    static void Main()
    {
        var edges = new[] { (0, 1, 4), (0, 2, 5), (1, 2, -3), (2, 3, 4) };
        Console.WriteLine(string.Join(" ", Solve(4, edges, 0)));
    }
}
