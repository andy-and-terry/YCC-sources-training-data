using System;

class FenwickTree
{
    private readonly int[] tree;
    private readonly int size;

    public FenwickTree(int size)
    {
        this.size = size;
        tree = new int[size + 1];
    }

    public void Add(int index, int delta)
    {
        for (index++; index <= size; index += index & (-index)) tree[index] += delta;
    }

    public int PrefixSum(int index)
    {
        int total = 0;
        for (index++; index > 0; index -= index & (-index)) total += tree[index];
        return total;
    }

    public int RangeSum(int left, int right) => PrefixSum(right) - (left > 0 ? PrefixSum(left - 1) : 0);

    static void Main()
    {
        var ft = new FenwickTree(6);
        var values = new[] { 1, 3, 5, 7, 9, 11 };
        for (int i = 0; i < values.Length; i++) ft.Add(i, values[i]);
        Console.WriteLine(ft.RangeSum(1, 3));
    }
}
