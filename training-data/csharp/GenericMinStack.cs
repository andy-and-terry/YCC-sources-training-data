using System;
using System.Collections.Generic;

class MinStack<T> where T : IComparable<T>
{
    private readonly Stack<(T Value, T Min)> _items = new();

    public void Push(T v)
    {
        var min = _items.Count > 0 && _items.Peek().Min.CompareTo(v) < 0 ? _items.Peek().Min : v;
        _items.Push((v, min));
    }

    public T Pop() => _items.Pop().Value;
    public T Min => _items.Peek().Min;
}

class Program
{
    static void Main()
    {
        var s = new MinStack<int>();
        foreach (var v in new[] { 5, 3, 7, 2 }) s.Push(v);
        Console.WriteLine(s.Min);
        s.Pop();
        Console.WriteLine(s.Min);
    }
}
