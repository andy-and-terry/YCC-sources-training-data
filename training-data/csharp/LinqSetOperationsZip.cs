using System;
using System.Linq;

class LinqSetOperationsZip
{
    static void Main()
    {
        int[] a = { 1, 2, 3, 4 }, b = { 3, 4, 5 };
        Console.WriteLine(string.Join(",", a.Union(b)) + " " + string.Join(",", a.Intersect(b)) + " " + string.Join(",", a.Except(b)));
        Console.WriteLine(string.Join(",", a.Zip(b, (x, y) => x * y)));
        Console.WriteLine(string.Join(",", a.Chunk(3).Select(c => c.Sum())));
        Console.WriteLine(string.Join(",", a.SkipWhile(x => x < 3).TakeWhile(x => x < 5)));
        Console.WriteLine(a.Any(x => x > 3) + " " + a.All(x => x > 3) + " " + a.Contains(2));
        Console.WriteLine(string.Join(",", Enumerable.Range(1, 5).Reverse().Select((x, i) => x * i)));
    }
}
