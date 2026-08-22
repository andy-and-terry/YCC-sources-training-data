using System;

class RotateArray
{
    static int[] Rotate(int[] nums, int k)
    {
        int n = nums.Length;
        k = ((k % n) + n) % n;
        var result = new int[n];
        for (int i = 0; i < n; i++) result[(i + k) % n] = nums[i];
        return result;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Rotate(new[] { 1, 2, 3, 4, 5, 6, 7 }, 3)));
    }
}
