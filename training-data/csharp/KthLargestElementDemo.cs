using System;
using System.Collections.Generic;

class KthLargestElementDemo
{
    static int KthLargest(int[] nums, int k)
    {
        var heap = new List<int>();
        foreach (int num in nums)
        {
            heap.Add(num);
            heap.Sort();
            if (heap.Count > k) heap.RemoveAt(0);
        }
        return heap[0];
    }

    static void Main()
    {
        Console.WriteLine(KthLargest(new[] { 3, 2, 1, 5, 6, 4 }, 2));
    }
}
