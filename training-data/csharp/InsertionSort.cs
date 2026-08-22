using System;

class InsertionSort
{
    static int[] Sort(int[] items)
    {
        var arr = (int[])items.Clone();
        for (int i = 1; i < arr.Length; i++)
        {
            int key = arr[i];
            int j = i - 1;
            while (j >= 0 && arr[j] > key)
            {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
        return arr;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sort(new[] { 5, 3, 8, 1, 9, 2 })));
    }
}
