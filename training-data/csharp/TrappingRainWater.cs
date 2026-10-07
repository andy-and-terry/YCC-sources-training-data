using System;

class TrappingRainWater
{
    static int Trap(int[] heights)
    {
        if (heights.Length == 0) return 0;

        int left = 0, right = heights.Length - 1;
        int leftMax = heights[left], rightMax = heights[right];
        int water = 0;

        while (left < right)
        {
            if (leftMax < rightMax)
            {
                left++;
                leftMax = Math.Max(leftMax, heights[left]);
                water += leftMax - heights[left];
            }
            else
            {
                right--;
                rightMax = Math.Max(rightMax, heights[right]);
                water += rightMax - heights[right];
            }
        }

        return water;
    }

    static void Main()
    {
        Console.WriteLine(Trap(new[] { 0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1 }));
    }
}
