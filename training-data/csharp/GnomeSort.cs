using System;
using System.Collections.Generic;

class GnomeSort
{
    static void Sort<T>(IList<T> a, Comparison<T> cmp)
    {
        int i = 0;
        while (i < a.Count)
        {
            if (i == 0 || cmp(a[i - 1], a[i]) <= 0)
            {
                i++;
            }
            else
            {
                (a[i - 1], a[i]) = (a[i], a[i - 1]);
                i--;
            }
        }
    }

    static void Main()
    {
        var nums = new List<int> { 34, 2, 10, -9, 7 };
        Sort(nums, (x, y) => x.CompareTo(y));
        Console.WriteLine(string.Join(" ", nums));
        var words = new List<string> { "Delta", "alpha", "Charlie", "bravo" };
        Sort(words, StringComparer.OrdinalIgnoreCase.Compare);
        Console.WriteLine(string.Join(" ", words));
    }
}
