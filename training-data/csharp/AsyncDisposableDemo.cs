using System;
using System.Threading.Tasks;

class AsyncDisposableDemo
{
    class Connection : IAsyncDisposable, IDisposable
    {
        public Connection() => Console.WriteLine("connected");
        public async ValueTask DisposeAsync()
        {
            await Task.Delay(5);
            Console.WriteLine("flushed and closed asynchronously");
        }
        public void Dispose() => Console.WriteLine("closed synchronously");
    }

    static async Task Main()
    {
        await using (var c = new Connection())
        {
            Console.WriteLine("using connection");
        }

        await using var c2 = new Connection();
        Console.WriteLine("end of Main reached");
    }
}
