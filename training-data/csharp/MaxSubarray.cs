using System;

class MaxSubarray
{
    static int Solve(int[] nums)
    {
        int best = nums[0], current = nums[0];
        for (int i = 1; i < nums.Length; i++)
        {
            current = Math.Max(nums[i], current + nums[i]);
            best = Math.Max(best, current);
        }
        return best;
    }

    static void Main()
    {
        Console.WriteLine(Solve(new[] { -2, 1, -3, 4, -1, 2, 1, -5, 4 }));
    }
}
