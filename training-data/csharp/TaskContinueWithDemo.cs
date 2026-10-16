using System;
using System.Threading.Tasks;

class TaskContinueWithDemo
{
    static async Task Main()
    {
        Task<int> compute = Task.Run(() => 6 * 7);
        Task<string> chained = compute.ContinueWith(t => $"answer={t.Result}");
        Console.WriteLine(await chained);

        Task failing = Task.Run(() => throw new InvalidOperationException("boom"));
        Task handler = failing.ContinueWith(
            t => Console.WriteLine("faulted: " + t.Exception!.InnerException!.Message),
            TaskContinuationOptions.OnlyOnFaulted);
        await handler;

        var results = await Task.WhenAll(
            Task.Run(() => 1), Task.Run(() => 2), Task.Run(() => 3));
        Console.WriteLine(results.Length + " " + (results[0] + results[1] + results[2]));

        Console.WriteLine(Task.CompletedTask.IsCompletedSuccessfully);
        Console.WriteLine(await Task.FromResult("done"));
    }
}
