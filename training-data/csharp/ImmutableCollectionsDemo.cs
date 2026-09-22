using System;
using System.Collections.Immutable;

class ImmutableCollectionsDemo
{
    static void Main()
    {
        ImmutableList<int> original = ImmutableList.Create(1, 2, 3);
        ImmutableList<int> withFour = original.Add(4);

        Console.WriteLine(string.Join(",", original));
        Console.WriteLine(string.Join(",", withFour));

        ImmutableDictionary<string, int> scores = ImmutableDictionary<string, int>.Empty
            .Add("Ada", 90)
            .Add("Bob", 85);
        ImmutableDictionary<string, int> updated = scores.SetItem("Ada", 95);

        Console.WriteLine(scores["Ada"]);
        Console.WriteLine(updated["Ada"]);
    }
}
