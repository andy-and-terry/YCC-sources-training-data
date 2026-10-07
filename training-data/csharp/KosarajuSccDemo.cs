using System;
using System.Collections.Generic;

class KosarajuSolver
{
    private readonly Dictionary<int, List<int>> graph;

    public KosarajuSolver(Dictionary<int, List<int>> graph) => this.graph = graph;

    public List<List<int>> FindSccs(IEnumerable<int> nodes)
    {
        var visited = new HashSet<int>();
        var order = new List<int>();
        foreach (int node in nodes)
            if (!visited.Contains(node)) FillOrder(node, visited, order);

        var reversed = Reverse(nodes);
        var seen = new HashSet<int>();
        var components = new List<List<int>>();
        for (int i = order.Count - 1; i >= 0; i--)
        {
            int node = order[i];
            if (seen.Contains(node)) continue;
            var component = new List<int>();
            CollectComponent(node, reversed, seen, component);
            components.Add(component);
        }
        return components;
    }

    private void FillOrder(int node, HashSet<int> visited, List<int> order)
    {
        visited.Add(node);
        foreach (int next in graph.GetValueOrDefault(node, new List<int>()))
            if (!visited.Contains(next)) FillOrder(next, visited, order);
        order.Add(node);
    }

    private void CollectComponent(int node, Dictionary<int, List<int>> reversed, HashSet<int> seen, List<int> component)
    {
        seen.Add(node);
        component.Add(node);
        foreach (int next in reversed.GetValueOrDefault(node, new List<int>()))
            if (!seen.Contains(next)) CollectComponent(next, reversed, seen, component);
    }

    private Dictionary<int, List<int>> Reverse(IEnumerable<int> nodes)
    {
        var reversed = new Dictionary<int, List<int>>();
        foreach (int node in nodes) reversed[node] = new List<int>();
        foreach (var (node, neighbors) in graph)
            foreach (int neighbor in neighbors)
                reversed[neighbor].Add(node);
        return reversed;
    }
}

class KosarajuSccDemo
{
    static void Main()
    {
        var graph = new Dictionary<int, List<int>>
        {
            [0] = new List<int> { 1 },
            [1] = new List<int> { 2 },
            [2] = new List<int> { 0, 3 },
            [3] = new List<int> { 4 },
            [4] = new List<int>()
        };

        var sccs = new KosarajuSolver(graph).FindSccs(new[] { 0, 1, 2, 3, 4 });
        foreach (var component in sccs)
            Console.WriteLine(string.Join(",", component));
    }
}
