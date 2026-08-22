using System;
using System.Collections.Generic;

class SlidingWindowMinimumDemo
{
    static List<int> MinSlidingWindow(int[] nums, int k)
    {
        var dq = new LinkedList<int>();
        var result = new List<int>();
        for (int i = 0; i < nums.Length; i++)
        {
            while (dq.Count > 0 && nums[dq.Last.Value] >= nums[i]) dq.RemoveLast();
            dq.AddLast(i);
            if (dq.First.Value <= i - k) dq.RemoveFirst();
            if (i >= k - 1) result.Add(nums[dq.First.Value]);
        }
        return result;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", MinSlidingWindow(new[] { 1, 3, -1, -3, 5, 3, 6, 7 }, 3)));
    }
}
