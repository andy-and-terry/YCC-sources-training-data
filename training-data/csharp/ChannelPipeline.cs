using System;
using System.Threading.Channels;
using System.Threading.Tasks;

public static class ChannelPipeline
{
    public static async Task Main()
    {
        var numbers = Channel.CreateBounded<int>(4);
        var squares = Channel.CreateUnbounded<int>();

        var producer = Task.Run(async () =>
        {
            for (var i = 1; i <= 10; i++) await numbers.Writer.WriteAsync(i);
            numbers.Writer.Complete();
        });

        var transformer = Task.Run(async () =>
        {
            await foreach (var n in numbers.Reader.ReadAllAsync()) await squares.Writer.WriteAsync(n * n);
            squares.Writer.Complete();
        });

        var total = 0;
        await foreach (var sq in squares.Reader.ReadAllAsync()) total += sq;
        await Task.WhenAll(producer, transformer);
        Console.WriteLine($"sum of squares = {total}");
    }
}
