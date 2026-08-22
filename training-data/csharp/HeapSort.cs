using System;

class HeapSort
{
    static void SiftDown(int[] arr, int start, int end)
    {
        int root = start;
        while (2 * root + 1 <= end)
        {
            int child = 2 * root + 1;
            if (child + 1 <= end && arr[child] < arr[child + 1]) child++;
            if (arr[root] < arr[child])
            {
                (arr[root], arr[child]) = (arr[child], arr[root]);
                root = child;
            }
            else return;
        }
    }

    static int[] Sort(int[] items)
    {
        var arr = (int[])items.Clone();
        int n = arr.Length;
        for (int start = n / 2 - 1; start >= 0; start--) SiftDown(arr, start, n - 1);
        for (int end = n - 1; end > 0; end--)
        {
            (arr[0], arr[end]) = (arr[end], arr[0]);
            SiftDown(arr, 0, end - 1);
        }
        return arr;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Sort(new[] { 5, 3, 8, 1, 9, 2 })));
    }
}
