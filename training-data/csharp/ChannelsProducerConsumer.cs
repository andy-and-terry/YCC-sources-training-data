using System;
using System.Threading.Channels;
using System.Threading.Tasks;

class ChannelsProducerConsumer
{
    static async Task Main()
    {
        var ch = Channel.CreateBounded<int>(2);
        var prod = Task.Run(async () =>
        {
            for (int i = 1; i <= 5; i++) await ch.Writer.WriteAsync(i);
            ch.Writer.Complete();
        });
        int sum = 0;
        await foreach (var v in ch.Reader.ReadAllAsync()) sum += v;
        await prod;
        Console.WriteLine(sum);
    }
}
