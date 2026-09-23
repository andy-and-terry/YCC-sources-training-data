using System;
using System.Threading.Tasks;

class ProgressReportingDemo
{
    static async Task ProcessItemsAsync(int count, IProgress<int> progress)
    {
        for (int i = 1; i <= count; i++)
        {
            await Task.Delay(1);
            progress.Report((int)(i * 100.0 / count));
        }
    }

    static async Task Main()
    {
        var progress = new Progress<int>(percent => Console.WriteLine($"progress: {percent}%"));
        await ProcessItemsAsync(5, progress);
        Console.WriteLine("done");
    }
}
