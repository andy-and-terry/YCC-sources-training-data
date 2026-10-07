using System;
using System.Threading;
using System.Threading.Tasks;

sealed class TransientException : Exception
{
    public TransientException(string message) : base(message) { }
}

class RetryWithBackoff
{
    static async Task<T> RetryAsync<T>(Func<int, Task<T>> operation, int attempts, TimeSpan baseDelay, TimeSpan cap, CancellationToken ct = default)
    {
        for (int attempt = 1; ; attempt++)
        {
            try
            {
                return await operation(attempt);
            }
            catch (TransientException e) when (attempt < attempts)
            {
                double ceiling = Math.Min(cap.TotalMilliseconds, baseDelay.TotalMilliseconds * Math.Pow(2, attempt));
                var delay = TimeSpan.FromMilliseconds(Random.Shared.NextDouble() * ceiling);
                Console.WriteLine($"attempt {attempt} failed ({e.Message}), waiting {delay.TotalMilliseconds:F0}ms");
                await Task.Delay(delay, ct);
            }
        }
    }

    static async Task Main()
    {
        string result = await RetryAsync(n => n < 4 ? throw new TransientException("timeout") : Task.FromResult($"ok after {n}"),
            5, TimeSpan.FromMilliseconds(10), TimeSpan.FromMilliseconds(200));
        Console.WriteLine(result);
        try
        {
            await RetryAsync<int>(_ => throw new TransientException("still down"), 2, TimeSpan.FromMilliseconds(5), TimeSpan.FromMilliseconds(50));
        }
        catch (TransientException e)
        {
            Console.WriteLine($"gave up: {e.Message}");
        }
    }
}
