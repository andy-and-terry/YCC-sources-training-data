using System;

class QuickSort
{
    static void Sort(int[] items, int low, int high)
    {
        if (low >= high) return;
        int pivot = items[(low + high) / 2];
        int i = low, j = high;
        while (i <= j)
        {
            while (items[i] < pivot) i++;
            while (items[j] > pivot) j--;
            if (i <= j)
            {
                (items[i], items[j]) = (items[j], items[i]);
                i++;
                j--;
            }
        }
        Sort(items, low, j);
        Sort(items, i, high);
    }

    static void Main()
    {
        int[] data = { 5, 3, 8, 1, 9, 2 };
        Sort(data, 0, data.Length - 1);
        Console.WriteLine(string.Join(" ", data));
    }
}
