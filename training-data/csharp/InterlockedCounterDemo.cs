using System;
using System.Threading;
using System.Threading.Tasks;

class InterlockedCounterDemo
{
    static int counter;

    static void Main()
    {
        var tasks = new Task[4];
        for (int t = 0; t < tasks.Length; t++)
            tasks[t] = Task.Run(() =>
            {
                for (int i = 0; i < 10000; i++)
                    Interlocked.Increment(ref counter);
            });
        Task.WaitAll(tasks);
        Console.WriteLine(counter);

        int old = Interlocked.CompareExchange(ref counter, 0, 40000);
        Console.WriteLine($"{old} -> {counter}");
    }
}
