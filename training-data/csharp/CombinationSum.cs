using System;
using System.Collections.Generic;
using System.Linq;

class CombinationSum
{
    static IEnumerable<int[]> Find(int[] candidates, int target)
    {
        var c = candidates.Distinct().OrderBy(x => x).ToArray();
        var path = new Stack<int>();

        IEnumerable<int[]> Search(int start, int remaining)
        {
            if (remaining == 0)
            {
                yield return path.Reverse().ToArray();
                yield break;
            }
            for (int i = start; i < c.Length && c[i] <= remaining; i++)
            {
                path.Push(c[i]);
                foreach (var combo in Search(i, remaining - c[i])) yield return combo;
                path.Pop();
            }
        }

        return Search(0, target);
    }

    static void Main()
    {
        foreach (var (cands, target) in new[] { (new[] { 2, 3, 6, 7 }, 7), (new[] { 2, 3, 5 }, 8) })
            Console.WriteLine(string.Join(" ", Find(cands, target).Select(x => "[" + string.Join(",", x) + "]")));
    }
}
