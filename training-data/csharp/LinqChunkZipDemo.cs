using System;
using System.Linq;

class LinqChunkZipDemo
{
    static void Main()
    {
        var numbers = Enumerable.Range(1, 10);
        foreach (var chunk in numbers.Chunk(4))
            Console.WriteLine("[" + string.Join(", ", chunk) + "]");

        string[] names = { "x", "y", "z" };
        int[] values = { 10, 20, 30 };
        foreach (var (n, v) in names.Zip(values))
            Console.WriteLine($"{n}={v}");

        Console.WriteLine(string.Join(" ", names.Zip(values, (n, v) => n + v)));
        Console.WriteLine(string.Join(" ", numbers.Skip(2).Take(3)));
        Console.WriteLine(string.Join(" ", numbers.TakeWhile(x => x < 4)));
        Console.WriteLine(string.Join(" ", numbers.SkipWhile(x => x < 8)));
        Console.WriteLine(string.Join(" ", numbers.TakeLast(2)));
    }
}
