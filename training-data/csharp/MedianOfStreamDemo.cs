using System;
using System.Collections.Generic;

class MedianOfStreamDemo
{
    private readonly List<int> values = new();

    void AddNum(int num)
    {
        int idx = values.BinarySearch(num);
        if (idx < 0) idx = ~idx;
        values.Insert(idx, num);
    }

    double FindMedian()
    {
        int n = values.Count;
        int mid = n / 2;
        return n % 2 == 0 ? (values[mid - 1] + values[mid]) / 2.0 : values[mid];
    }

    static void Main()
    {
        var mf = new MedianOfStreamDemo();
        foreach (int n in new[] { 5, 15, 1, 3 }) mf.AddNum(n);
        Console.WriteLine(mf.FindMedian());
    }
}
