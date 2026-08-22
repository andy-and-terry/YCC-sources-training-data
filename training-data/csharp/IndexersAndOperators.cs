using System;
using System.Collections.Generic;

class SparseArray
{
    private readonly Dictionary<int, int> values = new();

    public int this[int index]
    {
        get => values.TryGetValue(index, out var v) ? v : 0;
        set => values[index] = value;
    }

    static void Main()
    {
        var arr = new SparseArray();
        arr[5] = 42;
        arr[1000] = 7;
        Console.WriteLine($"{arr[5]} {arr[1000]} {arr[0]}");
    }
}
