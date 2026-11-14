using System;
using System.Threading.Channels;
using System.Threading.Tasks;

var ch = Channel.CreateBounded<int>(2);
var prod = Task.Run(async () =>
{
    for (int i = 0; i < 5; i++) await ch.Writer.WriteAsync(i);
    ch.Writer.Complete();
});
await foreach (var v in ch.Reader.ReadAllAsync()) Console.WriteLine(v);
await prod;
