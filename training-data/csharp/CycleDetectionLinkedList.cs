using System;

class CycleDetectionLinkedList
{
    sealed class Node
    {
        public int Value;
        public Node? Next;
        public Node(int value) => Value = value;
    }

    static (int Start, int Length)? Detect(Node? head)
    {
        Node? slow = head, fast = head;
        while (fast?.Next != null)
        {
            slow = slow!.Next;
            fast = fast.Next.Next;
            if (!ReferenceEquals(slow, fast)) continue;
            int length = 1;
            for (var p = slow!.Next; !ReferenceEquals(p, slow); p = p!.Next) length++;
            slow = head;
            while (!ReferenceEquals(slow, fast))
            {
                slow = slow!.Next;
                fast = fast!.Next;
            }
            return (slow!.Value, length);
        }
        return null;
    }

    static Node Build(int n, int loopTo)
    {
        var nodes = new Node[n];
        for (int i = 0; i < n; i++) nodes[i] = new Node(i * 10);
        for (int i = 0; i + 1 < n; i++) nodes[i].Next = nodes[i + 1];
        if (loopTo >= 0) nodes[^1].Next = nodes[loopTo];
        return nodes[0];
    }

    static void Main()
    {
        Console.WriteLine(Detect(Build(8, 3)));
        Console.WriteLine(Detect(Build(5, -1))?.ToString() ?? "no cycle");
    }
}
