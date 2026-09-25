using System;
using System.Linq;

record Job(char Id, int Deadline, int Profit);

class JobSequencing
{
    static int Find(int[] parent, int x) => parent[x] == x ? x : parent[x] = Find(parent, parent[x]);

    static void Main()
    {
        var jobs = new[] { new Job('a', 2, 100), new Job('b', 1, 19), new Job('c', 2, 27), new Job('d', 1, 25), new Job('e', 3, 15) };
        int maxD = jobs.Max(j => j.Deadline);
        var parent = Enumerable.Range(0, maxD + 1).ToArray();
        var slots = new Job?[maxD + 1];
        foreach (var job in jobs.OrderByDescending(j => j.Profit))
        {
            int free = Find(parent, job.Deadline);
            if (free == 0) continue;
            slots[free] = job;
            parent[free] = free - 1;
        }
        var chosen = slots.Where(j => j != null).Select(j => j!).ToList();
        Console.WriteLine($"{string.Join(" ", chosen.Select(j => j.Id))} profit={chosen.Sum(j => j.Profit)}");
    }
}
