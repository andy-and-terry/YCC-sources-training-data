using System;
using System.Collections.Generic;

public static class IsogramCheck
{
    public static bool IsIsogram(string word)
    {
        var seen = new HashSet<char>();
        foreach (var c in word.ToLowerInvariant())
            if (char.IsLetter(c) && !seen.Add(c)) return false;
        return true;
    }

    public static void Main()
    {
        foreach (var w in new[] { "lumberjacks", "background", "six-year-old", "isograms" })
            Console.WriteLine($"{w} {IsIsogram(w)}");
    }
}
