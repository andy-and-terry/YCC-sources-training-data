using System;
using System.Collections.Generic;
using System.Threading.Tasks;

class Program
{
    static async IAsyncEnumerable<int> Numbers()
    {
        for (int i = 1; i <= 3; i++)
        {
            await Task.Delay(1);
            yield return i * i;
        }
    }

    static async Task Main()
    {
        await foreach (var n in Numbers()) Console.WriteLine(n);
    }
}
