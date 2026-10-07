using System;
using System.Collections;
using System.Linq;

class PartitionEqualSubset
{
    static bool CanPartition(int[] nums)
    {
        int total = nums.Sum();
        if (total % 2 == 1) return false;
        int target = total / 2;
        var reach = new BitArray(target + 1) { [0] = true };
        foreach (int x in nums)
            for (int s = target; s >= x; s--)
                if (reach[s - x]) reach[s] = true;
        return reach[target];
    }

    static void Main()
    {
        Console.WriteLine($"{CanPartition(new[] { 1, 5, 11, 5 })} {CanPartition(new[] { 1, 2, 3, 5 })} {CanPartition(new[] { 3, 1, 1, 2, 2, 1 })}");
    }
}
