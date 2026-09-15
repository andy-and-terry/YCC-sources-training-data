using System;
using System.Collections.Generic;

class AvlNode
{
    public int Value;
    public AvlNode? Left;
    public AvlNode? Right;
    public int Height = 1;

    public AvlNode(int value) => Value = value;
}

class AvlTree
{
    private AvlNode? root;

    private static int Height(AvlNode? node) => node?.Height ?? 0;

    private static int BalanceFactor(AvlNode? node) => node == null ? 0 : Height(node.Left) - Height(node.Right);

    private static void UpdateHeight(AvlNode node) => node.Height = 1 + Math.Max(Height(node.Left), Height(node.Right));

    private static AvlNode RotateRight(AvlNode y)
    {
        var x = y.Left!;
        var t2 = x.Right;
        x.Right = y;
        y.Left = t2;
        UpdateHeight(y);
        UpdateHeight(x);
        return x;
    }

    private static AvlNode RotateLeft(AvlNode x)
    {
        var y = x.Right!;
        var t2 = y.Left;
        y.Left = x;
        x.Right = t2;
        UpdateHeight(x);
        UpdateHeight(y);
        return y;
    }

    public void Insert(int value) => root = Insert(root, value);

    private static AvlNode Insert(AvlNode? node, int value)
    {
        if (node == null) return new AvlNode(value);

        if (value < node.Value) node.Left = Insert(node.Left, value);
        else if (value > node.Value) node.Right = Insert(node.Right, value);
        else return node;

        UpdateHeight(node);
        int balance = BalanceFactor(node);

        if (balance > 1 && value < node.Left!.Value) return RotateRight(node);
        if (balance < -1 && value > node.Right!.Value) return RotateLeft(node);
        if (balance > 1 && value > node.Left!.Value)
        {
            node.Left = RotateLeft(node.Left!);
            return RotateRight(node);
        }
        if (balance < -1 && value < node.Right!.Value)
        {
            node.Right = RotateRight(node.Right!);
            return RotateLeft(node);
        }

        return node;
    }

    public List<int> InOrder()
    {
        var result = new List<int>();
        InOrder(root, result);
        return result;
    }

    private static void InOrder(AvlNode? node, List<int> result)
    {
        if (node == null) return;
        InOrder(node.Left, result);
        result.Add(node.Value);
        InOrder(node.Right, result);
    }

    static void Main()
    {
        var tree = new AvlTree();
        foreach (var v in new[] { 10, 20, 30, 40, 50, 25 }) tree.Insert(v);
        Console.WriteLine(string.Join(", ", tree.InOrder()));
    }
}
