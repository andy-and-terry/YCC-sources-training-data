using System;
using System.Collections.Generic;
using System.Linq;

static class Ext
{
    public static IEnumerable<IEnumerable<T>> Chunk2<T>(this IEnumerable<T> src, int size)
    {
        var list = src.ToList();
        for (int i = 0; i < list.Count; i += size)
            yield return list.Skip(i).Take(size);
    }
}

class Program
{
    static void Main()
    {
        foreach (var c in Enumerable.Range(1, 7).Chunk2(3))
            Console.WriteLine(string.Join(",", c));
    }
}
