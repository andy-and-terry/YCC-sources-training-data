using System;
using System.Threading.Channels;
using System.Threading.Tasks;

class ChannelProducerConsumerDemo
{
    static async Task ProduceAsync(ChannelWriter<int> writer, int count)
    {
        for (int i = 1; i <= count; i++)
        {
            await writer.WriteAsync(i * i);
        }
        writer.Complete();
    }

    static async Task ConsumeAsync(ChannelReader<int> reader)
    {
        await foreach (var item in reader.ReadAllAsync())
        {
            Console.WriteLine($"consumed {item}");
        }
    }

    static async Task Main()
    {
        var channel = Channel.CreateBounded<int>(3);

        var producer = ProduceAsync(channel.Writer, 5);
        var consumer = ConsumeAsync(channel.Reader);

        await Task.WhenAll(producer, consumer);
        Console.WriteLine("done");
    }
}
