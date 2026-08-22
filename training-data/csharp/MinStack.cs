using System;
using System.Collections.Generic;

class MinStack
{
    private readonly Stack<int> items = new();
    private readonly Stack<int> mins = new();

    public void Push(int value)
    {
        items.Push(value);
        mins.Push(mins.Count == 0 ? value : Math.Min(value, mins.Peek()));
    }

    public int Pop()
    {
        mins.Pop();
        return items.Pop();
    }

    public int GetMin() => mins.Peek();

    static void Main()
    {
        var s = new MinStack();
        s.Push(3);
        s.Push(1);
        s.Push(2);
        Console.WriteLine(s.GetMin());
        s.Pop();
        Console.WriteLine(s.GetMin());
    }
}
