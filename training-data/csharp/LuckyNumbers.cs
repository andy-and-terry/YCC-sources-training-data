using System;
using System.Collections.Generic;

public static class LuckyNumbers
{
    public static List<int> Lucky(int limit)
    {
        var nums = new List<int>();
        for (int v = 1; v < limit; v += 2)
            nums.Add(v);

        for (int i = 1; i < nums.Count && nums[i] <= nums.Count; i++)
        {
            int step = nums[i];
            var kept = new List<int>();
            for (int idx = 0; idx < nums.Count; idx++)
                if ((idx + 1) % step != 0)
                    kept.Add(nums[idx]);
            nums = kept;
        }
        return nums;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Lucky(100)));
    }
}
