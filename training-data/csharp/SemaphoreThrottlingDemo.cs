using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

class SemaphoreThrottlingDemo
{
    static async Task<int> DoWorkAsync(int id, SemaphoreSlim gate)
    {
        await gate.WaitAsync();
        try
        {
            Console.WriteLine($"task {id} started");
            await Task.Delay(30);
            Console.WriteLine($"task {id} finished");
            return id * id;
        }
        finally
        {
            gate.Release();
        }
    }

    static async Task Main()
    {
        using var gate = new SemaphoreSlim(2);
        var tasks = Enumerable.Range(1, 5).Select(id => DoWorkAsync(id, gate));
        var results = await Task.WhenAll(tasks);
        Console.WriteLine(string.Join(",", results));
    }
}
