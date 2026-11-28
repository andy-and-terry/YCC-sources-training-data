using System;
using System.Collections.Generic;
using System.Threading.Tasks;

await foreach (var n in Numbers(4)) Console.WriteLine(n);

static async IAsyncEnumerable<int> Numbers(int count)
{
    for (int i = 0; i < count; i++)
    {
        await Task.Delay(5);
        yield return i * i;
    }
}
