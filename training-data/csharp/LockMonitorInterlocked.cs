using System;
using System.Threading;
using System.Threading.Tasks;

class LockMonitorInterlocked
{
    static int locked, atomic;
    static readonly object gate = new();

    static void Main()
    {
        Parallel.For(0, 1000, _ =>
        {
            lock (gate) { locked++; }
            Interlocked.Increment(ref atomic);
        });
        Console.WriteLine($"{locked} {atomic}");
    }
}
