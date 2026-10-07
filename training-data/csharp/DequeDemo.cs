using System;
using System.Collections.Generic;
using System.Linq;

class DequeDemo
{
    static void Main()
    {
        var deque = new LinkedList<int>();
        deque.AddLast(1);
        deque.AddLast(2);
        deque.AddFirst(0);
        Console.WriteLine(string.Join(" ", deque));

        int front = deque.First!.Value;
        deque.RemoveFirst();
        Console.WriteLine(front);

        int back = deque.Last!.Value;
        deque.RemoveLast();
        Console.WriteLine(back);

        Console.WriteLine(string.Join(" ", deque.ToList()));
    }
}
