using System;
using System.Collections.Generic;
using System.Linq;

record Interval(int Start, int End)
{
    public override string ToString() => $"[{Start},{End})";
}

class IntervalScheduling
{
    static List<Interval> MaxNonOverlapping(IEnumerable<Interval> intervals)
    {
        var chosen = new List<Interval>();
        int end = int.MinValue;
        foreach (var iv in intervals.OrderBy(i => i.End))
        {
            if (iv.Start < end) continue;
            chosen.Add(iv);
            end = iv.End;
        }
        return chosen;
    }

    static int MinRooms(IEnumerable<Interval> intervals)
    {
        var ends = new PriorityQueue<int, int>();
        foreach (var iv in intervals.OrderBy(i => i.Start))
        {
            if (ends.TryPeek(out _, out int earliest) && earliest <= iv.Start) ends.Dequeue();
            ends.Enqueue(iv.End, iv.End);
        }
        return ends.Count;
    }

    static void Main()
    {
        var m = new[] { (1, 4), (3, 5), (0, 6), (5, 7), (3, 9), (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16) }
            .Select(p => new Interval(p.Item1, p.Item2)).ToList();
        Console.WriteLine(string.Join(" ", MaxNonOverlapping(m)));
        Console.WriteLine($"rooms needed: {MinRooms(m)}");
    }
}
