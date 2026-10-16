using System;
using System.Threading;
using System.Threading.Tasks;

class AsyncLocalDemo
{
    static readonly AsyncLocal<string> RequestId = new();
    static readonly ThreadLocal<int> PerThread = new(() => 100);

    static async Task Handle(string id)
    {
        RequestId.Value = id;
        await Task.Delay(10);
        Console.WriteLine($"{id} sees {RequestId.Value} after await");
    }

    static async Task Main()
    {
        await Task.WhenAll(Handle("req-1"), Handle("req-2"), Handle("req-3"));
        Console.WriteLine("outer sees: " + (RequestId.Value ?? "null"));

        PerThread.Value++;
        int other = 0;
        var t = new Thread(() => other = PerThread.Value);
        t.Start(); t.Join();
        Console.WriteLine($"main={PerThread.Value} other={other}");
    }
}
