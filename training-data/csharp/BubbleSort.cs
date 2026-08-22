using System;

class BubbleSort
{
    static int[] Sort(int[] items)
    {
        var arr = (int[])items.Clone();
        for (int i = 0; i < arr.Length; i++)
        {
            bool swapped = false;
            for (int j = 0; j < arr.Length - i - 1; j++)
            {
                if (arr[j] > arr[j + 1])
                {
                    (arr[j], arr[j + 1]) = (arr[j + 1], arr[j]);
                    swapped = true;
                }
            }
            if (!swapped) break;
        }
        return arr;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sort(new[] { 5, 3, 8, 1, 9, 2 })));
    }
}
