using System;
using System.Collections.Generic;

class TrieNode
{
    public Dictionary<char, TrieNode> Children = new();
    public bool IsWord = false;
}

class Trie
{
    private readonly TrieNode root = new();

    public void Insert(string word)
    {
        var node = root;
        foreach (char ch in word)
        {
            if (!node.Children.ContainsKey(ch)) node.Children[ch] = new TrieNode();
            node = node.Children[ch];
        }
        node.IsWord = true;
    }

    private TrieNode Find(string s)
    {
        var node = root;
        foreach (char ch in s)
        {
            if (!node.Children.TryGetValue(ch, out node)) return null;
        }
        return node;
    }

    public bool Search(string word) => Find(word)?.IsWord ?? false;

    public bool StartsWith(string prefix) => Find(prefix) != null;

    static void Main()
    {
        var trie = new Trie();
        foreach (var word in new[] { "cat", "car", "card", "care" }) trie.Insert(word);
        Console.WriteLine($"{trie.Search("car")} {trie.Search("ca")} {trie.StartsWith("ca")}");
    }
}
