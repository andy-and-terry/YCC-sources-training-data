using System;

public static class PairSumSorted
{
    public static (int I, int J)? Find(int[] nums, int target)
    {
        int i = 0, j = nums.Length - 1;
        while (i < j)
        {
            var s = nums[i] + nums[j];
            if (s == target) return (i, j);
            if (s < target) i++; else j--;
        }
        return null;
    }

    public static void Main()
    {
        Console.WriteLine(Find(new[] { 1, 3, 4, 6, 8, 11 }, 10));
        Console.WriteLine(Find(new[] { 1, 2, 3 }, 100)?.ToString() ?? "none");
    }
}
