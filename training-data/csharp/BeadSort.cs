using System;
using System.Linq;

// Bead (gravity) sort.
class BeadSort {
    static int[] Sort(int[] nums) {
        var cols = new int[nums.Max()];
        foreach (var n in nums) for (int i = 0; i < n; i++) cols[i]++;
        return Enumerable.Range(0, nums.Length).Select(r => cols.Count(c => c > r)).Reverse().ToArray();
    }
    static void Main() => Console.WriteLine(string.Join(",", Sort(new[] { 5, 3, 1, 4, 2 })));
}
