using System;
using System.Threading;
using System.Threading.Tasks;

class CancellationTokenTimeout
{
    static async Task Work(CancellationToken ct)
    {
        for (int i = 0; ; i++)
        {
            ct.ThrowIfCancellationRequested();
            await Task.Delay(10, ct);
        }
    }

    static async Task Main()
    {
        using var cts = new CancellationTokenSource(50);
        try { await Work(cts.Token); }
        catch (OperationCanceledException) { Console.WriteLine("cancelled"); }
    }
}
