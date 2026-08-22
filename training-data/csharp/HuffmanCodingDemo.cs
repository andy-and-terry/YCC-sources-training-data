using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

class HuffNode
{
    public char? Ch;
    public int Freq;
    public HuffNode Left, Right;
}

class HuffmanCodingDemo
{
    static HuffNode BuildTree(string text)
    {
        var counts = new Dictionary<char, int>();
        foreach (char ch in text) counts[ch] = counts.GetValueOrDefault(ch) + 1;

        var heap = counts.Select(kv => new HuffNode { Ch = kv.Key, Freq = kv.Value }).ToList();
        while (heap.Count > 1)
        {
            heap = heap.OrderBy(n => n.Freq).ToList();
            var a = heap[0];
            var b = heap[1];
            heap.RemoveRange(0, 2);
            heap.Add(new HuffNode { Freq = a.Freq + b.Freq, Left = a, Right = b });
        }
        return heap[0];
    }

    static void BuildCodes(HuffNode node, string prefix, Dictionary<char, string> codes)
    {
        if (node.Ch.HasValue)
        {
            codes[node.Ch.Value] = prefix.Length == 0 ? "0" : prefix;
            return;
        }
        BuildCodes(node.Left, prefix + "0", codes);
        BuildCodes(node.Right, prefix + "1", codes);
    }

    static string Encode(string text)
    {
        var codes = new Dictionary<char, string>();
        BuildCodes(BuildTree(text), "", codes);
        var sb = new StringBuilder();
        foreach (char ch in text) sb.Append(codes[ch]);
        return sb.ToString();
    }

    static void Main()
    {
        Console.WriteLine(Encode("abracadabra"));
    }
}
