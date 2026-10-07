using System;

class ContainerWithMostWater
{
    static int MaxArea(int[] heights)
    {
        int left = 0, right = heights.Length - 1;
        int best = 0;

        while (left < right)
        {
            int width = right - left;
            int height = Math.Min(heights[left], heights[right]);
            best = Math.Max(best, width * height);

            if (heights[left] < heights[right]) left++;
            else right--;
        }

        return best;
    }

    static void Main()
    {
        Console.WriteLine(MaxArea(new[] { 1, 8, 6, 2, 5, 4, 8, 3, 7 }));
    }
}
