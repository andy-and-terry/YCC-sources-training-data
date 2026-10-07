using System;

class SkipListDemo
{
    class Node
    {
        public int Value;
        public Node?[] Forward;
        public Node(int value, int level)
        {
            Value = value;
            Forward = new Node?[level + 1];
        }
    }

    class SkipList
    {
        const int MaxLevel = 4;
        readonly Node head = new(int.MinValue, MaxLevel);
        readonly Random rng = new(42);
        int level = 0;

        int RandomLevel()
        {
            int lvl = 0;
            while (rng.NextDouble() < 0.5 && lvl < MaxLevel) lvl++;
            return lvl;
        }

        public void Insert(int value)
        {
            var update = new Node[MaxLevel + 1];
            var current = head;
            for (int i = level; i >= 0; i--)
            {
                while (current.Forward[i] != null && current.Forward[i]!.Value < value)
                    current = current.Forward[i]!;
                update[i] = current;
            }

            int lvl = RandomLevel();
            if (lvl > level)
            {
                for (int i = level + 1; i <= lvl; i++) update[i] = head;
                level = lvl;
            }

            var node = new Node(value, lvl);
            for (int i = 0; i <= lvl; i++)
            {
                node.Forward[i] = update[i].Forward[i];
                update[i].Forward[i] = node;
            }
        }

        public bool Contains(int value)
        {
            var current = head;
            for (int i = level; i >= 0; i--)
                while (current.Forward[i] != null && current.Forward[i]!.Value < value)
                    current = current.Forward[i]!;
            var next = current.Forward[0];
            return next != null && next.Value == value;
        }
    }

    static void Main()
    {
        var list = new SkipList();
        foreach (var v in new[] { 3, 6, 7, 9, 12 }) list.Insert(v);
        Console.WriteLine(list.Contains(7));
        Console.WriteLine(list.Contains(8));
    }
}
