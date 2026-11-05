using System;
using System.Linq;

class Program
{
    static void Main()
    {
        var words = new[] { "apple", "avocado", "banana", "blueberry", "cherry" };
        var q = words.GroupBy(w => w[0])
                     .Select(g => new { Letter = g.Key, Count = g.Count(), Longest = g.Max(w => w.Length) });
        foreach (var x in q)
            Console.WriteLine($"{x.Letter}: {x.Count} longest={x.Longest}");
    }
}
