using System;

class FloydWarshall
{
    static int[,] Solve(int numNodes, (int, int, int)[] edges)
    {
        const int inf = int.MaxValue / 2;
        var dist = new int[numNodes, numNodes];
        for (int i = 0; i < numNodes; i++)
            for (int j = 0; j < numNodes; j++)
                dist[i, j] = i == j ? 0 : inf;
        foreach (var (u, v, w) in edges) dist[u, v] = w;

        for (int k = 0; k < numNodes; k++)
            for (int i = 0; i < numNodes; i++)
                for (int j = 0; j < numNodes; j++)
                    if (dist[i, k] + dist[k, j] < dist[i, j]) dist[i, j] = dist[i, k] + dist[k, j];

        return dist;
    }

    static void Main()
    {
        var edges = new[] { (0, 1, 3), (0, 2, 8), (1, 2, 2), (2, 3, 1), (3, 0, 4) };
        var dist = Solve(4, edges);
        for (int i = 0; i < 4; i++)
        {
            for (int j = 0; j < 4; j++) Console.Write(dist[i, j] + " ");
            Console.WriteLine();
        }
    }
}
