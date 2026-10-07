using System;
using System.Collections.Generic;

interface IResettable
{
    void Reset();
}

class Counter : IResettable
{
    public int Value { get; private set; }
    public void Increment() => Value++;
    public void Reset() => Value = 0;
}

class Widget : IResettable
{
    public string State { get; private set; } = "new";
    public void Use() => State = "used";
    public void Reset() => State = "new";
}

class ObjectPool<T> where T : IResettable, new()
{
    private readonly Stack<T> pool = new();

    public T Rent() => pool.Count > 0 ? pool.Pop() : new T();

    public void Return(T item)
    {
        item.Reset();
        pool.Push(item);
    }
}

class GenericFactoryConstraintDemo
{
    static void Main()
    {
        var counters = new ObjectPool<Counter>();
        var c1 = counters.Rent();
        c1.Increment();
        c1.Increment();
        Console.WriteLine(c1.Value);
        counters.Return(c1);

        var c2 = counters.Rent();
        Console.WriteLine(c2.Value);
        Console.WriteLine(ReferenceEquals(c1, c2));

        var widgets = new ObjectPool<Widget>();
        var w = widgets.Rent();
        w.Use();
        Console.WriteLine(w.State);
        widgets.Return(w);
        Console.WriteLine(widgets.Rent().State);
    }
}
