using System;

class ProductExceptSelf
{
    static long[] Compute(int[] nums)
    {
        var output = new long[nums.Length];
        long prefix = 1;
        for (int i = 0; i < nums.Length; i++)
        {
            output[i] = prefix;
            prefix *= nums[i];
        }
        long suffix = 1;
        for (int i = nums.Length - 1; i >= 0; i--)
        {
            output[i] *= suffix;
            suffix *= nums[i];
        }
        return output;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Compute(new[] { 1, 2, 3, 4 })));
        Console.WriteLine(string.Join(" ", Compute(new[] { -1, 1, 0, -3, 3 })));
    }
}
