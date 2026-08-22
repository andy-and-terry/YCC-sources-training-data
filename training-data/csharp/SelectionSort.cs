using System;

class SelectionSort
{
    static int[] Sort(int[] items)
    {
        var arr = (int[])items.Clone();
        for (int i = 0; i < arr.Length; i++)
        {
            int minIdx = i;
            for (int j = i + 1; j < arr.Length; j++)
                if (arr[j] < arr[minIdx]) minIdx = j;
            (arr[i], arr[minIdx]) = (arr[minIdx], arr[i]);
        }
        return arr;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sort(new[] { 5, 3, 8, 1, 9, 2 })));
    }
}
