using System;

class RangeSum
{
    private readonly long[] prefix;

    public RangeSum(int[] values)
    {
        prefix = new long[values.Length + 1];
        for (int i = 0; i < values.Length; i++) prefix[i + 1] = prefix[i] + values[i];
    }

    public long Query(int lo, int hi) => prefix[hi] - prefix[lo];

    static void Main() => Console.WriteLine(new RangeSum(new[] { 3, 1, 4, 1, 5, 9, 2, 6 }).Query(2, 5));
}
