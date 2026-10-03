using System;

class LowestCommonAncestor
{
    class TreeNode
    {
        public int Value;
        public TreeNode? Left;
        public TreeNode? Right;
        public TreeNode(int value) => Value = value;
    }

    static TreeNode? Find(TreeNode? node, int p, int q)
    {
        if (node == null) return null;
        if (node.Value == p || node.Value == q) return node;

        var left = Find(node.Left, p, q);
        var right = Find(node.Right, p, q);

        if (left != null && right != null) return node;
        return left ?? right;
    }

    static void Main()
    {
        var root = new TreeNode(6)
        {
            Left = new TreeNode(2) { Left = new TreeNode(0), Right = new TreeNode(4) },
            Right = new TreeNode(8),
        };
        var result = Find(root, 0, 4);
        Console.WriteLine(result?.Value);
    }
}
