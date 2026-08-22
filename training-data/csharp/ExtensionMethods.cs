using System;
using System.Collections.Generic;
using System.Linq;

static class EnumerableExtensions
{
    public static IEnumerable<IEnumerable<T>> ChunkBy<T>(this IEnumerable<T> source, int size)
    {
        var list = source.ToList();
        for (int i = 0; i < list.Count; i += size)
            yield return list.Skip(i).Take(size);
    }

    public static bool IsPalindrome(this string s)
    {
        var cleaned = new string(s.Where(char.IsLetterOrDigit).ToArray()).ToLower();
        return cleaned == new string(cleaned.Reverse().ToArray());
    }
}

class ExtensionMethods
{
    static void Main()
    {
        var numbers = Enumerable.Range(1, 10);
        foreach (var chunk in numbers.ChunkBy(3)) Console.WriteLine(string.Join(",", chunk));

        Console.WriteLine("A man a plan a canal Panama".IsPalindrome());
        Console.WriteLine("hello".IsPalindrome());
    }
}
