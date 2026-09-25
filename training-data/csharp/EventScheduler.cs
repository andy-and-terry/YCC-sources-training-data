using System;
using System.Collections.Generic;

sealed class Simulator
{
    readonly PriorityQueue<(string Label, Action Action), (double Time, long Seq)> queue =
        new(Comparer<(double Time, long Seq)>.Create((a, b) => a.Time != b.Time ? a.Time.CompareTo(b.Time) : a.Seq.CompareTo(b.Seq)));
    long seq;

    public double Now { get; private set; }

    public void After(double delay, string label, Action? action = null) =>
        queue.Enqueue((label, action ?? (() => { })), (Now + delay, seq++));

    public void Run()
    {
        while (queue.TryDequeue(out var ev, out var key))
        {
            Now = key.Time;
            Console.WriteLine($"t={Now,4:F1} {ev.Label}");
            ev.Action();
        }
    }
}

class EventScheduler
{
    static void Main()
    {
        var sim = new Simulator();
        double serverFree = 0;
        var customers = new[] { (0.0, 3.0), (1.0, 2.0), (1.5, 4.0), (6.0, 1.0) };
        for (int i = 0; i < customers.Length; i++)
        {
            int id = i;
            var (arrive, service) = customers[i];
            sim.After(arrive, $"c{id} arrives", () =>
            {
                double start = Math.Max(sim.Now, serverFree);
                serverFree = start + service;
                sim.After(serverFree - sim.Now, $"c{id} leaves (waited {start - arrive:F1})");
            });
        }
        sim.Run();
    }
}
