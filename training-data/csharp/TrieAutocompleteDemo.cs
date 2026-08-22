using System;
using System.Collections.Generic;
using System.Linq;

class ACNode
{
    public Dictionary<char, ACNode> Children = new();
    public bool IsWord;
}

class TrieAutocompleteDemo
{
    private readonly ACNode root = new();

    public TrieAutocompleteDemo(string[] words)
    {
        foreach (var w in words) Insert(w);
    }

    public void Insert(string word)
    {
        var node = root;
        foreach (char ch in word)
        {
            if (!node.Children.ContainsKey(ch)) node.Children[ch] = new ACNode();
            node = node.Children[ch];
        }
        node.IsWord = true;
    }

    public List<string> Suggestions(string prefix)
    {
        var node = root;
        foreach (char ch in prefix)
        {
            if (!node.Children.TryGetValue(ch, out node)) return new List<string>();
        }
        var results = new List<string>();
        void Collect(ACNode n, string path)
        {
            if (n.IsWord) results.Add(prefix + path);
            foreach (var (ch, child) in n.Children) Collect(child, path + ch);
        }
        Collect(node, "");
        results.Sort();
        return results;
    }

    static void Main()
    {
        var ac = new TrieAutocompleteDemo(new[] { "cat", "car", "card", "care", "dog" });
        Console.WriteLine(string.Join(" ", ac.Suggestions("ca")));
    }
}
