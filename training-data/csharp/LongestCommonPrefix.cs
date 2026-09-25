using System;
using System.Linq;

class LongestCommonPrefix
{
    static string Of(params string[] words)
    {
        if (words.Length == 0) return "";
        var sorted = words.OrderBy(w => w, StringComparer.Ordinal).ToArray();
        string lo = sorted[0], hi = sorted[^1];
        int i = 0;
        while (i < lo.Length && lo[i] == hi[i]) i++;
        return lo[..i];
    }

    static void Main()
    {
        Console.WriteLine($"\"{Of("flower", "flow", "flight")}\"");
        Console.WriteLine($"\"{Of("dog", "racecar", "car")}\"");
        Console.WriteLine($"\"{Of("interspecies", "interstellar", "interstate")}\"");
    }
}
