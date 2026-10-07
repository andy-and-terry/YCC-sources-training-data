using System;
using System.Collections.Generic;
using System.Linq;

class SerializeDeserializeBinaryTree
{
    class TreeNode
    {
        public int Value;
        public TreeNode? Left;
        public TreeNode? Right;
        public TreeNode(int value) => Value = value;
    }

    static void SerializeHelper(TreeNode? node, List<string> output)
    {
        if (node == null)
        {
            output.Add("#");
            return;
        }
        output.Add(node.Value.ToString());
        SerializeHelper(node.Left, output);
        SerializeHelper(node.Right, output);
    }

    static string Serialize(TreeNode? root)
    {
        var output = new List<string>();
        SerializeHelper(root, output);
        return string.Join(",", output);
    }

    static TreeNode? DeserializeHelper(Queue<string> tokens)
    {
        var token = tokens.Dequeue();
        if (token == "#") return null;

        var node = new TreeNode(int.Parse(token));
        node.Left = DeserializeHelper(tokens);
        node.Right = DeserializeHelper(tokens);
        return node;
    }

    static TreeNode? Deserialize(string data)
    {
        var tokens = new Queue<string>(data.Split(','));
        return DeserializeHelper(tokens);
    }

    static void Main()
    {
        var root = new TreeNode(1) { Left = new TreeNode(2), Right = new TreeNode(3) };
        var serialized = Serialize(root);
        Console.WriteLine(serialized);
        var restored = Deserialize(serialized);
        Console.WriteLine(Serialize(restored));
    }
}
