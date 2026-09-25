using System;
using System.Collections.Generic;

class CocktailShakerSort
{
    static void Sort<T>(T[] a, IComparer<T>? comparer = null)
    {
        comparer ??= Comparer<T>.Default;
        int lo = 0, hi = a.Length - 1;
        bool swapped = true;
        while (swapped)
        {
            swapped = false;
            for (int i = lo; i < hi; i++)
            {
                if (comparer.Compare(a[i], a[i + 1]) > 0)
                {
                    (a[i], a[i + 1]) = (a[i + 1], a[i]);
                    swapped = true;
                }
            }
            hi--;
            for (int i = hi; i > lo; i--)
            {
                if (comparer.Compare(a[i - 1], a[i]) > 0)
                {
                    (a[i - 1], a[i]) = (a[i], a[i - 1]);
                    swapped = true;
                }
            }
            lo++;
        }
    }

    static void Main()
    {
        int[] nums = { 5, 1, 4, 2, 8, 0, 2 };
        Sort(nums);
        Console.WriteLine(string.Join(" ", nums));
        string[] words = { "pear", "apple", "fig" };
        Sort(words, StringComparer.Ordinal);
        Console.WriteLine(string.Join(" ", words));
    }
}
