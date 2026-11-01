using System;
using System.Threading.Channels;
using System.Threading.Tasks;

class Program
{
    static async Task Main()
    {
        var ch = Channel.CreateBounded<int>(2);
        var producer = Task.Run(async () =>
        {
            for (int i = 0; i < 5; i++) await ch.Writer.WriteAsync(i);
            ch.Writer.Complete();
        });
        await foreach (var x in ch.Reader.ReadAllAsync()) Console.WriteLine($"got {x}");
        await producer;
    }
}
