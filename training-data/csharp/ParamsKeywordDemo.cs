using System;
using System.Linq;

class ParamsKeywordDemo
{
    static int Sum(params int[] values) => values.Sum();

    static string Join(string separator, params object[] parts) =>
        string.Join(separator, parts.Select(p => p?.ToString() ?? "null"));

    static void Main()
    {
        Console.WriteLine(Sum());
        Console.WriteLine(Sum(1, 2, 3));
        Console.WriteLine(Sum(new[] { 10, 20 }));
        Console.WriteLine(Join(" | ", "a", 1, 2.5, null, true));
    }
}
