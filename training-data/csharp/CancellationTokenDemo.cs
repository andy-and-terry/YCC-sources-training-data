using System;
using System.Threading;
using System.Threading.Tasks;

class CancellationTokenDemo
{
    static async Task CountAsync(int max, CancellationToken token)
    {
        for (int i = 1; i <= max; i++)
        {
            token.ThrowIfCancellationRequested();
            Console.WriteLine($"count {i}");
            await Task.Delay(20, token);
        }
    }

    static async Task Main()
    {
        using var cts = new CancellationTokenSource();
        cts.CancelAfter(70);

        try
        {
            await CountAsync(10, cts.Token);
        }
        catch (OperationCanceledException)
        {
            Console.WriteLine("operation was cancelled");
        }
    }
}
