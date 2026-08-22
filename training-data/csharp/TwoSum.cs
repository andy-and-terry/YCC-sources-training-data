using System;
using System.Collections.Generic;

class TwoSum
{
    static (int, int) Solve(int[] nums, int target)
    {
        var seen = new Dictionary<int, int>();
        for (int i = 0; i < nums.Length; i++)
        {
            if (seen.TryGetValue(target - nums[i], out int j)) return (j, i);
            seen[nums[i]] = i;
        }
        return (-1, -1);
    }

    static void Main()
    {
        var (a, b) = Solve(new[] { 2, 7, 11, 15 }, 9);
        Console.WriteLine($"{a} {b}");
    }
}
