using System;
using System.Threading;
using System.Threading.Tasks;

class SafeCounter
{
    private readonly object _gate = new();
    private int _value;

    public void Increment()
    {
        lock (_gate)
        {
            _value++;
        }
    }

    public int Value
    {
        get { lock (_gate) { return _value; } }
    }
}

class LockMonitorDemo
{
    static void Main()
    {
        var counter = new SafeCounter();
        var tasks = new Task[4];
        for (int t = 0; t < tasks.Length; t++)
        {
            tasks[t] = Task.Run(() =>
            {
                for (int i = 0; i < 10_000; i++) counter.Increment();
            });
        }
        Task.WaitAll(tasks);
        Console.WriteLine(counter.Value);

        int interlocked = 0;
        Parallel.For(0, 1000, _ => Interlocked.Increment(ref interlocked));
        Console.WriteLine(interlocked);
    }
}
