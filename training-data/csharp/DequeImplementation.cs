using System;
using System.Collections;
using System.Collections.Generic;

sealed class RingDeque<T> : IEnumerable<T>
{
    T[] buf = new T[4];
    int head;

    public int Count { get; private set; }

    void Grow()
    {
        if (Count < buf.Length) return;
        var next = new T[buf.Length * 2];
        for (int i = 0; i < Count; i++) next[i] = buf[(head + i) % buf.Length];
        buf = next;
        head = 0;
    }

    public void PushBack(T x)
    {
        Grow();
        buf[(head + Count++) % buf.Length] = x;
    }

    public void PushFront(T x)
    {
        Grow();
        head = (head - 1 + buf.Length) % buf.Length;
        buf[head] = x;
        Count++;
    }

    public T PopFront()
    {
        if (Count == 0) throw new InvalidOperationException("deque is empty");
        T x = buf[head];
        buf[head] = default!;
        head = (head + 1) % buf.Length;
        Count--;
        return x;
    }

    public T PopBack()
    {
        if (Count == 0) throw new InvalidOperationException("deque is empty");
        int i = (head + --Count) % buf.Length;
        T x = buf[i];
        buf[i] = default!;
        return x;
    }

    public IEnumerator<T> GetEnumerator()
    {
        for (int i = 0; i < Count; i++) yield return buf[(head + i) % buf.Length];
    }

    IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
}

class DequeImplementation
{
    static void Main()
    {
        var d = new RingDeque<int>();
        for (int i = 0; i < 5; i++)
        {
            d.PushBack(i);
            d.PushFront(-i);
        }
        Console.WriteLine(string.Join(" ", d));
        int front = d.PopFront(), back = d.PopBack();
        Console.WriteLine($"{front} {back} {d.Count}");
    }
}
