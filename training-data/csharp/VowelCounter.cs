using System;
using System.Linq;

class VowelCounter
{
    static void Main()
    {
        var counts = "Education is beautiful".ToLower()
            .Where(c => "aeiou".Contains(c))
            .GroupBy(c => c)
            .OrderBy(g => g.Key);
        foreach (var g in counts) Console.Write($"{g.Key}={g.Count()} ");
        Console.WriteLine();
    }
}
