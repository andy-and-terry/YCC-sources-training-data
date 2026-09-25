using System;
using System.Collections.Generic;
using System.Linq;

class MergeSortedArrays
{
    static IEnumerable<int> MergeK(IEnumerable<IEnumerable<int>> sources)
    {
        var enumerators = sources.Select(s => s.GetEnumerator()).ToList();
        var pq = new PriorityQueue<int, int>(); // element = source index, priority = value
        for (int i = 0; i < enumerators.Count; i++)
            if (enumerators[i].MoveNext()) pq.Enqueue(i, enumerators[i].Current);
        while (pq.TryDequeue(out int idx, out int value))
        {
            yield return value;
            if (enumerators[idx].MoveNext()) pq.Enqueue(idx, enumerators[idx].Current);
        }
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", MergeK(new[] { new[] { 1, 4, 7 }, new[] { 2, 3, 8, 9 } })));
        Console.WriteLine(string.Join(" ", MergeK(new[] { new[] { 1, 5, 9 }, new[] { 2, 6 }, Array.Empty<int>(), new[] { 0, 3, 4, 10 } })));
        var multiples = new[] { 3, 5, 7 }.Select(k => Enumerable.Range(1, 6).Select(i => i * k));
        Console.WriteLine(string.Join(" ", MergeK(multiples)));
    }
}
