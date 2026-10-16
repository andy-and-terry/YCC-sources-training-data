using System;
using System.Collections.Generic;

class CollectionExpressionsDemo
{
    static int Total(ReadOnlySpan<int> values)
    {
        int t = 0;
        foreach (var v in values) t += v;
        return t;
    }

    static void Main()
    {
        int[] a = [1, 2, 3];
        List<string> names = ["ann", "bob"];
        int[] b = [0, .. a, 99];
        List<int> empty = [];
        IEnumerable<int> seq = [4, 5];

        Console.WriteLine(string.Join(",", b));
        Console.WriteLine(names.Count + " " + empty.Count);
        Console.WriteLine(Total([10, 20, 30]));
        Console.WriteLine(string.Join(",", [.. seq, .. a]));
        int[][] jagged = [[1], [2, 3], []];
        Console.WriteLine(jagged.Length + " " + jagged[1][1]);
    }
}
