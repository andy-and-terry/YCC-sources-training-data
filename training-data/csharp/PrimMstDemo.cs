using System;
using System.Collections.Generic;

class PrimMstDemo
{
    static int PrimMst(int numNodes, Dictionary<int, List<(int To, int Weight)>> graph)
    {
        var inMst = new bool[numNodes];
        var minEdge = new int[numNodes];
        Array.Fill(minEdge, int.MaxValue);
        minEdge[0] = 0;
        int totalWeight = 0;

        for (int iter = 0; iter < numNodes; iter++)
        {
            int u = -1;
            int best = int.MaxValue;
            for (int i = 0; i < numNodes; i++)
            {
                if (!inMst[i] && minEdge[i] < best)
                {
                    best = minEdge[i];
                    u = i;
                }
            }
            if (u == -1) break;

            inMst[u] = true;
            totalWeight += best;

            if (graph.TryGetValue(u, out var edges))
            {
                foreach (var (to, weight) in edges)
                {
                    if (!inMst[to] && weight < minEdge[to]) minEdge[to] = weight;
                }
            }
        }

        return totalWeight;
    }

    static void Main()
    {
        var graph = new Dictionary<int, List<(int, int)>>
        {
            [0] = new() { (1, 1), (2, 3) },
            [1] = new() { (0, 1), (2, 4), (3, 2) },
            [2] = new() { (0, 3), (1, 4), (3, 5) },
            [3] = new() { (1, 2), (2, 5) },
        };

        Console.WriteLine(PrimMst(4, graph));
    }
}
