using System;

class BinarySearchVariants
{
    static int BinarySearch(int[] items, int target)
    {
        int low = 0, high = items.Length - 1;
        while (low <= high)
        {
            int mid = (low + high) / 2;
            if (items[mid] == target) return mid;
            if (items[mid] < target) low = mid + 1;
            else high = mid - 1;
        }
        return -1;
    }

    static int LowerBound(int[] items, int target)
    {
        int low = 0, high = items.Length;
        while (low < high)
        {
            int mid = (low + high) / 2;
            if (items[mid] < target) low = mid + 1;
            else high = mid;
        }
        return low;
    }

    static void Main()
    {
        var data = new[] { 1, 2, 2, 2, 3, 5, 8 };
        Console.WriteLine(BinarySearch(data, 5));
        Console.WriteLine(LowerBound(data, 2));
    }
}
