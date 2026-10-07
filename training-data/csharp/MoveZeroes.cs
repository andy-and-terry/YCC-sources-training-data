using System;
using System.Collections.Generic;

class MoveZeroes
{
    // Stable: moves every default(T) to the end.
    static void MoveDefaultsToEnd<T>(T[] a)
    {
        var cmp = EqualityComparer<T>.Default;
        int w = 0;
        for (int r = 0; r < a.Length; r++)
            if (!cmp.Equals(a[r], default!)) a[w++] = a[r];
        Array.Fill(a, default!, w, a.Length - w);
    }

    static void Main()
    {
        int[] nums = { 0, 1, 0, 3, 12, 0, 7 };
        MoveDefaultsToEnd(nums);
        Console.WriteLine(string.Join(" ", nums));
        string?[] words = { null, "a", null, "b" };
        MoveDefaultsToEnd(words);
        Console.WriteLine(string.Join(",", words));
    }
}
