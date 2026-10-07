using System;
using System.Threading.Tasks;

class TaskCompletionSourceDemo
{
    static Task<int> LegacyCallback(Action<int> register)
    {
        var tcs = new TaskCompletionSource<int>();
        register(result => tcs.SetResult(result));
        return tcs.Task;
    }

    static async Task Main()
    {
        var tcs = new TaskCompletionSource<string>();
        _ = Task.Run(async () =>
        {
            await Task.Delay(50);
            tcs.SetResult("done");
        });
        Console.WriteLine(await tcs.Task);

        int value = await LegacyCallback(cb => cb(99));
        Console.WriteLine(value);

        var failing = new TaskCompletionSource<int>();
        failing.SetException(new InvalidOperationException("boom"));
        try { await failing.Task; }
        catch (InvalidOperationException e) { Console.WriteLine(e.Message); }
    }
}
