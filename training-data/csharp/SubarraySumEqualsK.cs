// Count contiguous subarrays whose sum equals k (prefix sums + Dictionary).
using System;
using System.Collections.Generic;

class SubarraySumEqualsK
{
    static int Count(int[] nums, int k)
    {
        var seen = new Dictionary<int, int> { [0] = 1 };
        int total = 0, count = 0;
        foreach (int x in nums)
        {
            total += x;
            if (seen.TryGetValue(total - k, out int c)) count += c;
            seen[total] = seen.GetValueOrDefault(total) + 1;
        }
        return count;
    }

    static void Main() => Console.WriteLine(Count(new[] { 1, 1, 1 }, 2));
}
