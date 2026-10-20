using System;
using System.Collections.Generic;
using System.Linq;

static class Ext
{
    public static IEnumerable<T> EveryNth<T>(this IEnumerable<T> src, int n) =>
        src.Where((_, i) => i % n == 0);
}

class Program
{
    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 10).EveryNth(3)));
    }
}
