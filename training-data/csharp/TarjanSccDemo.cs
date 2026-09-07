using System;
using System.Collections.Generic;

class TarjanSolver
{
    private readonly Dictionary<int, List<int>> graph;
    private readonly Dictionary<int, int> indices = new();
    private readonly Dictionary<int, int> lowLink = new();
    private readonly HashSet<int> onStack = new();
    private readonly Stack<int> stack = new();
    private readonly List<List<int>> components = new();
    private int index = 0;

    public TarjanSolver(Dictionary<int, List<int>> graph) => this.graph = graph;

    public List<List<int>> FindSccs(IEnumerable<int> nodes)
    {
        foreach (int v in nodes)
            if (!indices.ContainsKey(v)) StrongConnect(v);
        return components;
    }

    private void StrongConnect(int v)
    {
        indices[v] = index;
        lowLink[v] = index;
        index++;
        stack.Push(v);
        onStack.Add(v);

        foreach (int w in graph.GetValueOrDefault(v, new List<int>()))
        {
            if (!indices.ContainsKey(w))
            {
                StrongConnect(w);
                lowLink[v] = Math.Min(lowLink[v], lowLink[w]);
            }
            else if (onStack.Contains(w))
            {
                lowLink[v] = Math.Min(lowLink[v], indices[w]);
            }
        }

        if (lowLink[v] == indices[v])
        {
            var component = new List<int>();
            int w;
            do
            {
                w = stack.Pop();
                onStack.Remove(w);
                component.Add(w);
            } while (w != v);
            components.Add(component);
        }
    }
}

class TarjanSccDemo
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

        var sccs = new TarjanSolver(graph).FindSccs(new[] { 0, 1, 2, 3, 4 });
        foreach (var component in sccs)
            Console.WriteLine(string.Join(",", component));
    }
}
