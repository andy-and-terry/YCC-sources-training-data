using System;
using System.Threading.Tasks;

class TaskWhenAllAsyncDemo
{
    static async Task<int> FetchAsync(int id)
    {
        await Task.Delay(10);
        return id * id;
    }

    static async Task<int> RunAllAsync()
    {
        Task<int>[] tasks = { FetchAsync(1), FetchAsync(2), FetchAsync(3) };
        int[] results = await Task.WhenAll(tasks);
        int total = 0;
        foreach (int r in results) total += r;
        return total;
    }

    static void Main()
    {
        int total = RunAllAsync().Result;
        Console.WriteLine("total: " + total);
    }
}
