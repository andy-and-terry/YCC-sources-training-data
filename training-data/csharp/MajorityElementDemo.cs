using System;

class MajorityElementDemo
{
    static int Solve(int[] nums)
    {
        int count = 0, candidate = 0;
        foreach (int num in nums)
        {
            if (count == 0) candidate = num;
            count += num == candidate ? 1 : -1;
        }
        return candidate;
    }

    static void Main()
    {
        Console.WriteLine(Solve(new[] { 2, 2, 1, 1, 1, 2, 2 }));
    }
}
