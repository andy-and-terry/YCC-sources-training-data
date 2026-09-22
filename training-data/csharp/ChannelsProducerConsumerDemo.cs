using System;
using System.Threading.Channels;
using System.Threading.Tasks;

class ChannelsProducerConsumerDemo
{
    static async Task Produce(ChannelWriter<int> writer, int count)
    {
        for (int i = 1; i <= count; i++)
        {
            await writer.WriteAsync(i);
        }
        writer.Complete();
    }

    static async Task Consume(ChannelReader<int> reader)
    {
        await foreach (var item in reader.ReadAllAsync())
        {
            Console.WriteLine($"consumed {item}");
        }
    }

    static async Task Main()
    {
        var channel = Channel.CreateBounded<int>(capacity: 2);

        var producer = Produce(channel.Writer, 5);
        var consumer = Consume(channel.Reader);

        await Task.WhenAll(producer, consumer);
    }
}
