using System;

class SegmentTree
{
    private readonly int n;
    private readonly int[] tree;

    public SegmentTree(int[] data)
    {
        n = data.Length;
        tree = new int[2 * n];
        Array.Copy(data, 0, tree, n, n);
        for (int i = n - 1; i > 0; i--) tree[i] = tree[2 * i] + tree[2 * i + 1];
    }

    public void Update(int index, int value)
    {
        int i = index + n;
        tree[i] = value;
        while (i > 1)
        {
            i /= 2;
            tree[i] = tree[2 * i] + tree[2 * i + 1];
        }
    }

    public int Query(int left, int right)
    {
        left += n; right += n;
        int total = 0;
        while (left < right)
        {
            if (left % 2 == 1) total += tree[left++];
            if (right % 2 == 1) total += tree[--right];
            left /= 2; right /= 2;
        }
        return total;
    }

    static void Main()
    {
        var tree = new SegmentTree(new[] { 1, 3, 5, 7, 9, 11 });
        Console.WriteLine(tree.Query(1, 4));
        tree.Update(1, 10);
        Console.WriteLine(tree.Query(1, 4));
    }
}
