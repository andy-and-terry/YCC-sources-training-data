using System;
using System.Threading.Tasks;

class TaskWhenAnyDemo
{
    static async Task<string> SimulateServer(string name, int delayMs)
    {
        await Task.Delay(delayMs);
        return $"{name} responded after {delayMs}ms";
    }

    static async Task Main()
    {
        var primary = SimulateServer("primary", 150);
        var backup = SimulateServer("backup", 50);

        Task<string> winner = await Task.WhenAny(primary, backup);
        Console.WriteLine($"fastest: {await winner}");

        var slowService = SimulateServer("slow-service", 300);
        var timeout = Task.Delay(100);
        var completed = await Task.WhenAny(slowService, timeout);
        Console.WriteLine(completed == timeout ? "timed out" : "completed in time");
    }
}
