using System;
using System.Collections.Generic;
using System.Threading.Tasks;

class AsyncStreamsDemo
{
    static async IAsyncEnumerable<int> CountUpAsync(int count)
    {
        for (int i = 1; i <= count; i++)
        {
            await Task.Delay(1);
            yield return i * i;
        }
    }

    static async Task Main()
    {
        await foreach (int value in CountUpAsync(5))
        {
            Console.WriteLine(value);
        }
    }
}
