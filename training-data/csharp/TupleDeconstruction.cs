using System;
using System.Collections.Generic;

class TupleDeconstruction
{
    static (int min, int max, double avg) Stats(IEnumerable<int> nums)
    {
        int min = int.MaxValue, max = int.MinValue, sum = 0, count = 0;
        foreach (int n in nums)
        {
            min = Math.Min(min, n);
            max = Math.Max(max, n);
            sum += n;
            count++;
        }
        return (min, max, (double)sum / count);
    }

    static void Main()
    {
        var (min, max, avg) = Stats(new[] { 5, 3, 8, 1, 9, 2 });
        Console.WriteLine($"min={min} max={max} avg={avg}");
    }
}
