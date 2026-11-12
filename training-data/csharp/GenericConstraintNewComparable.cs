using System;
using System.Collections.Generic;
class Program {
    static T Make<T>() where T : new() => new T();
    static T Max<T>(IEnumerable<T> xs) where T : IComparable<T> {
        T best = default!; bool first = true;
        foreach (var x in xs) if (first || x.CompareTo(best) > 0) { best = x; first = false; }
        return best;
    }
    static void Main() {
        Console.WriteLine(Make<List<int>>().Count);
        Console.WriteLine(Max(new[] { 3, 8, 2 }));
    }
}
