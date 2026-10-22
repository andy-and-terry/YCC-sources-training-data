using System;
using System.Collections.Generic;
using System.Linq;

public static class LuckyNumbers
{
    public static List<int> Lucky(int limit)
    {
        var nums = Enumerable.Range(0, (limit + 1) / 2).Select(k => 2 * k + 1).ToList();
        for (int i = 1; i < nums.Count && nums[i] <= nums.Count; i++)
        {
            int step = nums[i];
            nums = nums.Where((v, idx) => (idx + 1) % step != 0).ToList();
        }
        return nums;
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Lucky(50)));
    }
}
