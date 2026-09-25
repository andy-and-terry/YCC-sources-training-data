using System;

public static class MaxProductSubarray
{
    public static long MaxProduct(long[] nums)
    {
        long best = nums[0], hi = nums[0], lo = nums[0];
        foreach (var x in nums.AsSpan(1))
        {
            if (x < 0) (hi, lo) = (lo, hi);
            hi = Math.Max(x, hi * x);
            lo = Math.Min(x, lo * x);
            best = Math.Max(best, hi);
        }
        return best;
    }

    public static void Main()
    {
        Console.WriteLine($"{MaxProduct(new long[] { 2, 3, -2, 4 })} {MaxProduct(new long[] { -2, 3, -4 })}");
    }
}
