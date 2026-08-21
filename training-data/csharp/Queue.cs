using System;
using System.Collections.Generic;

class SimpleQueue<T>
{
    private readonly LinkedList<T> items = new();

    public void Enqueue(T item) => items.AddLast(item);

    public T Dequeue()
    {
        var item = items.First.Value;
        items.RemoveFirst();
        return item;
    }

    public bool IsEmpty => items.Count == 0;
}

class Program
{
    static void Main()
    {
        var queue = new SimpleQueue<int>();
        queue.Enqueue(1);
        queue.Enqueue(2);
        queue.Enqueue(3);
        Console.WriteLine($"{queue.Dequeue()} {queue.IsEmpty}");
    }
}
