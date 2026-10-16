using System;
using System.Collections.Generic;

class SortedSetRangeDemo
{
    static void Main()
    {
        var set = new SortedSet<int> { 50, 10, 40, 20, 30, 20 };
        Console.WriteLine(string.Join(" ", set));
        Console.WriteLine($"min={set.Min} max={set.Max}");

        var view = set.GetViewBetween(15, 40);
        Console.WriteLine(string.Join(" ", view));

        Console.WriteLine(string.Join(" ", set.Reverse()));

        var other = new SortedSet<int> { 30, 40, 60 };
        set.IntersectWith(other);
        Console.WriteLine(string.Join(" ", set));
        Console.WriteLine(set.IsSubsetOf(new[] { 30, 40, 50 }));
    }
}
