using System;
using System.Collections.Generic;

class ArraySegmentDemo
{
    static int Sum(ArraySegment<int> seg)
    {
        int t = 0;
        foreach (int x in seg) t += x;
        return t;
    }

    static void Main()
    {
        int[] data = { 10, 20, 30, 40, 50, 60 };
        var middle = new ArraySegment<int>(data, 1, 3);
        Console.WriteLine(Sum(middle));
        Console.WriteLine(middle.Count + " " + middle.Offset);

        middle[0] = 999;
        Console.WriteLine(data[1]);

        var tail = middle.Slice(1);
        Console.WriteLine(string.Join(",", tail));

        int[] copy = new int[3];
        middle.CopyTo(copy, 0);
        Console.WriteLine(string.Join(",", copy));

        Console.WriteLine(string.Join(",", data[^2..]));
        Console.WriteLine(Array.IndexOf(data, 40) + " " + Array.Exists(data, x => x > 55));
    }
}
