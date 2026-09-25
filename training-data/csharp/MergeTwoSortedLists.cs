using System;
using System.Collections.Generic;

class MergeTwoSortedLists
{
    static LinkedList<T> Merge<T>(LinkedList<T> a, LinkedList<T> b) where T : IComparable<T>
    {
        var result = new LinkedList<T>();
        LinkedListNode<T>? x = a.First, y = b.First;
        while (x != null && y != null)
        {
            if (x.Value.CompareTo(y.Value) <= 0)
            {
                result.AddLast(x.Value);
                x = x.Next;
            }
            else
            {
                result.AddLast(y.Value);
                y = y.Next;
            }
        }
        for (; x != null; x = x.Next) result.AddLast(x.Value);
        for (; y != null; y = y.Next) result.AddLast(y.Value);
        return result;
    }

    static void Main()
    {
        var merged = Merge(new LinkedList<int>(new[] { 1, 2, 4, 9 }), new LinkedList<int>(new[] { 1, 3, 4, 5, 10 }));
        Console.WriteLine(string.Join(" ", merged));
        Console.WriteLine(string.Join(" ", Merge(new LinkedList<string>(new[] { "ant", "cat" }), new LinkedList<string>(new[] { "bee", "dog" }))));
    }
}
