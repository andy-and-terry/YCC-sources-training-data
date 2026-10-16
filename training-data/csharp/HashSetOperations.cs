using System;
using System.Collections.Generic;

class HashSetOperations
{
    static void Main()
    {
        var a = new HashSet<string> { "red", "green", "blue" };
        var b = new HashSet<string> { "green", "yellow" };

        Console.WriteLine(a.Add("red") + " " + a.Add("pink"));
        Console.WriteLine(a.Overlaps(b));

        var union = new HashSet<string>(a);
        union.UnionWith(b);
        Console.WriteLine(union.Count);

        var diff = new HashSet<string>(a);
        diff.ExceptWith(b);
        Console.WriteLine(string.Join(",", diff));

        var sym = new HashSet<string>(a);
        sym.SymmetricExceptWith(b);
        Console.WriteLine(sym.Count);

        Console.WriteLine(a.IsSupersetOf(new[] { "red", "blue" }));
        Console.WriteLine(a.SetEquals(new[] { "pink", "blue", "green", "red" }));
    }
}
