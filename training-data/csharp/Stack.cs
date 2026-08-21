using System;
using System.Collections.Generic;

class SimpleStack<T>
{
    private readonly List<T> items = new();

    public void Push(T item) => items.Add(item);

    public T Pop()
    {
        var item = items[^1];
        items.RemoveAt(items.Count - 1);
        return item;
    }

    public T Peek() => items[^1];

    public bool IsEmpty => items.Count == 0;
}

class Program
{
    static void Main()
    {
        var stack = new SimpleStack<int>();
        stack.Push(1);
        stack.Push(2);
        stack.Push(3);
        Console.WriteLine($"{stack.Pop()} {stack.Peek()} {stack.IsEmpty}");
    }
}
