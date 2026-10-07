using System;

class BinaryTreeDiameter
{
    class TreeNode
    {
        public int Value;
        public TreeNode? Left;
        public TreeNode? Right;
        public TreeNode(int value) => Value = value;
    }

    static int maxDiameter;

    static int Height(TreeNode? node)
    {
        if (node == null) return 0;
        int leftHeight = Height(node.Left);
        int rightHeight = Height(node.Right);
        maxDiameter = Math.Max(maxDiameter, leftHeight + rightHeight);
        return Math.Max(leftHeight, rightHeight) + 1;
    }

    static int Diameter(TreeNode? root)
    {
        maxDiameter = 0;
        Height(root);
        return maxDiameter;
    }

    static void Main()
    {
        var root = new TreeNode(1)
        {
            Left = new TreeNode(2) { Left = new TreeNode(4), Right = new TreeNode(5) },
            Right = new TreeNode(3),
        };
        Console.WriteLine(Diameter(root));
    }
}
