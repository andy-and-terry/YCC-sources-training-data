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
        for (int i = 0; i < tasks.Length; i++)
            tasks[i] = Task.Run(() =>
            {
                for (int j = 0; j < 10_000; j++) counter.Increment();
            });

        Task.WaitAll(tasks);
        Console.WriteLine(counter.Value);

        int shared = 0;
        Interlocked.Add(ref shared, 5);
        Interlocked.Increment(ref shared);
        Console.WriteLine(shared);
    }
}
