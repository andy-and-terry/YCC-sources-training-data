using System;
using System.Collections.Generic;
using System.Linq;

class ListMode
{
    static IEnumerable<int> Modes(IEnumerable<int> items)
    {
        var groups = items.GroupBy(x => x).ToList();
        int top = groups.Max(g => g.Count());
        return groups.Where(g => g.Count() == top).Select(g => g.Key).OrderBy(x => x);
    }

    static void Main() => Console.WriteLine(string.Join(",", Modes(new[] { 1, 2, 2, 3, 3, 4 })));
}
