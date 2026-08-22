using System;
using System.Collections.Generic;

class CircularBuffer<T>
{
    private readonly T[] buffer;
    private readonly int capacity;
    private int head, size;

    public CircularBuffer(int capacity)
    {
        this.capacity = capacity;
        buffer = new T[capacity];
    }

    public void Append(T item)
    {
        int tail = (head + size) % capacity;
        buffer[tail] = item;
        if (size < capacity) size++;
        else head = (head + 1) % capacity;
    }

    public List<T> ToList()
    {
        var result = new List<T>();
        for (int i = 0; i < size; i++) result.Add(buffer[(head + i) % capacity]);
        return result;
    }

    static void Main()
    {
        var cb = new CircularBuffer<int>(3);
        for (int i = 0; i < 5; i++) cb.Append(i);
        Console.WriteLine(string.Join(" ", cb.ToList()));
    }
}
