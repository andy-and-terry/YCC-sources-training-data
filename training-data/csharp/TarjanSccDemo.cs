using System;
using System.Collections.Generic;

class TarjanSccDemo
{
    static int index = 0;
    static Stack<int> stack = new Stack<int>();
    static Dictionary<int, int> indices = new Dictionary<int, int>();
    static Dictionary<int, int> lowLink = new Dictionary<int, int>();
    static HashSet<int> onStack = new HashSet<int>();
    static List<List<int>> components = new List<List<int>>();

    static void StrongConnect(int v, Dictionary<int, List<int>> graph)
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
                StrongConnect(w, graph);
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

    static List<List<int>> FindSccs(Dictionary<int, List<int>> graph, IEnumerable<int> nodes)
    {
        foreach (int v in nodes)
            if (!indices.ContainsKey(v)) StrongConnect(v, graph);
        return components;
    }

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

        var sccs = FindSccs(graph, new[] { 0, 1, 2, 3, 4 });
        foreach (var component in sccs)
            Console.WriteLine(string.Join(",", component));
    }
}
