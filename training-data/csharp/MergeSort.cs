using System;
using System.Linq;

class MergeSort
{
    static int[] Sort(int[] items)
    {
        if (items.Length <= 1) return items;
        int mid = items.Length / 2;
        var left = Sort(items[..mid]);
        var right = Sort(items[mid..]);
        return Merge(left, right);
    }

    static int[] Merge(int[] left, int[] right)
    {
        var result = new int[left.Length + right.Length];
        int i = 0, j = 0, k = 0;
        while (i < left.Length && j < right.Length)
        {
            result[k++] = left[i] <= right[j] ? left[i++] : right[j++];
        }
        while (i < left.Length) result[k++] = left[i++];
        while (j < right.Length) result[k++] = right[j++];
        return result;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sort(new[] { 5, 3, 8, 1, 9, 2 })));
    }
}
