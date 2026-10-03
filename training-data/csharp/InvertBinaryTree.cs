using System;
using System.Collections.Generic;

class InvertBinaryTree
{
    class TreeNode
    {
        public int Value;
        public TreeNode? Left;
        public TreeNode? Right;
        public TreeNode(int value) => Value = value;
    }

    static TreeNode? Invert(TreeNode? node)
    {
        if (node == null) return null;
        (node.Left, node.Right) = (Invert(node.Right), Invert(node.Left));
        return node;
    }

    static void Inorder(TreeNode? node, List<int> result)
    {
        if (node == null) return;
        Inorder(node.Left, result);
        result.Add(node.Value);
        Inorder(node.Right, result);
    }

    static void Main()
    {
        var root = new TreeNode(4)
        {
            Left = new TreeNode(2) { Left = new TreeNode(1), Right = new TreeNode(3) },
            Right = new TreeNode(7),
        };
        Invert(root);
        var result = new List<int>();
        Inorder(root, result);
        Console.WriteLine(string.Join(" ", result));
    }
}
