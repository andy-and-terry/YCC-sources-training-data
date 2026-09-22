using System;

class SkipListNode
{
    public int Value;
    public SkipListNode?[] Forward;

    public SkipListNode(int value, int level)
    {
        Value = value;
        Forward = new SkipListNode?[level + 1];
    }
}

class SkipList
{
    private const int MaxLevel = 4;
    private const double P = 0.5;
    private readonly SkipListNode head = new(int.MinValue, MaxLevel);
    private readonly Random rng;
    private int level = 0;

    public SkipList(int seed) => rng = new Random(seed);

    private int RandomLevel()
    {
        int lvl = 0;
        while (lvl < MaxLevel && rng.NextDouble() < P) lvl++;
        return lvl;
    }

    public void Insert(int value)
    {
        var update = new SkipListNode[MaxLevel + 1];
        var current = head;
        for (int i = level; i >= 0; i--)
        {
            while (current.Forward[i] != null && current.Forward[i]!.Value < value)
                current = current.Forward[i]!;
            update[i] = current;
        }

        int newLevel = RandomLevel();
        if (newLevel > level)
        {
            for (int i = level + 1; i <= newLevel; i++) update[i] = head;
            level = newLevel;
        }

        var node = new SkipListNode(value, newLevel);
        for (int i = 0; i <= newLevel; i++)
        {
            node.Forward[i] = update[i].Forward[i];
            update[i].Forward[i] = node;
        }
    }

    public bool Contains(int value)
    {
        var current = head;
        for (int i = level; i >= 0; i--)
        {
            while (current.Forward[i] != null && current.Forward[i]!.Value < value)
                current = current.Forward[i]!;
        }
        current = current.Forward[0];
        return current != null && current.Value == value;
    }

    public void PrintSorted()
    {
        var current = head.Forward[0];
        while (current != null)
        {
            Console.Write(current.Value + " ");
            current = current.Forward[0];
        }
        Console.WriteLine();
    }
}

class SkipListDemo
{
    static void Main()
    {
        var list = new SkipList(42);
        foreach (var v in new[] { 3, 6, 7, 9, 12, 19, 17, 26, 21, 25 }) list.Insert(v);

        list.PrintSorted();
        Console.WriteLine(list.Contains(19));
        Console.WriteLine(list.Contains(15));
    }
}
