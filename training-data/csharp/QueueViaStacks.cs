using System;
using System.Collections.Generic;

class QueueViaStacks
{
    private readonly Stack<int> inStack = new();
    private readonly Stack<int> outStack = new();

    public void Enqueue(int item) => inStack.Push(item);

    public int? Dequeue()
    {
        if (outStack.Count == 0)
            while (inStack.Count > 0) outStack.Push(inStack.Pop());
        return outStack.Count == 0 ? null : outStack.Pop();
    }

    static void Main()
    {
        var q = new QueueViaStacks();
        q.Enqueue(1);
        q.Enqueue(2);
        q.Enqueue(3);
        Console.WriteLine($"{q.Dequeue()} {q.Dequeue()}");
    }
}
