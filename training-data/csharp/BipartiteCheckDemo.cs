using System;
using System.Collections.Generic;

class BipartiteCheckDemo
{
    static bool IsBipartite(Dictionary<int, List<int>> graph, IEnumerable<int> nodes)
    {
        var color = new Dictionary<int, int>();
        foreach (int start in nodes)
        {
            if (color.ContainsKey(start)) continue;
            color[start] = 0;
            var queue = new Queue<int>();
            queue.Enqueue(start);
            while (queue.Count > 0)
            {
                int node = queue.Dequeue();
                foreach (int neighbor in graph.GetValueOrDefault(node, new List<int>()))
                {
                    if (!color.ContainsKey(neighbor))
                    {
                        color[neighbor] = 1 - color[node];
                        queue.Enqueue(neighbor);
                    }
                    else if (color[neighbor] == color[node])
                    {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    static void Main()
    {
        var bipartite = new Dictionary<int, List<int>>
        {
            [0] = new List<int> { 1, 3 },
            [1] = new List<int> { 0, 2 },
            [2] = new List<int> { 1, 3 },
            [3] = new List<int> { 0, 2 }
        };

        var notBipartite = new Dictionary<int, List<int>>
        {
            [0] = new List<int> { 1, 2 },
            [1] = new List<int> { 0, 2 },
            [2] = new List<int> { 0, 1 }
        };

        Console.WriteLine(IsBipartite(bipartite, new[] { 0, 1, 2, 3 }));
        Console.WriteLine(IsBipartite(notBipartite, new[] { 0, 1, 2 }));
    }
}
