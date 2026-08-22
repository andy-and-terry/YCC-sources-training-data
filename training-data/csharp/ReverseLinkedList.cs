using System;
using System.Collections.Generic;

class Node
{
    public int Value;
    public Node Next;
    public Node(int value, Node next = null) { Value = value; Next = next; }
}

class ReverseLinkedList
{
    static Node Reverse(Node head)
    {
        Node prev = null;
        while (head != null)
        {
            var next = head.Next;
            head.Next = prev;
            prev = head;
            head = next;
        }
        return prev;
    }

    static List<int> ToList(Node head)
    {
        var result = new List<int>();
        while (head != null)
        {
            result.Add(head.Value);
            head = head.Next;
        }
        return result;
    }

    static void Main()
    {
        var head = new Node(1, new Node(2, new Node(3, new Node(4))));
        Console.WriteLine(string.Join(" ", ToList(Reverse(head))));
    }
}
