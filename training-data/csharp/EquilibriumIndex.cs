using System;
using System.Linq;

class EquilibriumIndex
{
    static int Find(int[] nums)
    {
        long total = nums.Sum(x => (long)x), left = 0;
        for (int i = 0; i < nums.Length; i++)
        {
            if (left == total - left - nums[i]) return i;
            left += nums[i];
        }
        return -1;
    }

    static void Main() => Console.WriteLine(Find(new[] { 1, 7, 3, 6, 5, 6 })); // 3
}
