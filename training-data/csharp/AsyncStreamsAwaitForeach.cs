using System;
using System.Collections.Generic;
using System.Threading.Tasks;

class AsyncStreamsAwaitForeach
{
    static async IAsyncEnumerable<int> Ticks(int n)
    {
        for (int i = 0; i < n; i++) { await Task.Delay(5); yield return i; }
    }

    static async Task Main()
    {
        await foreach (var t in Ticks(4)) Console.Write(t + " ");
        Console.WriteLine();
    }
}
