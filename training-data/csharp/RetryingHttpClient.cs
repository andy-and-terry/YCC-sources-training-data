using System;
using System.Threading.Tasks;

class RetryingHttpClient
{
    private readonly Func<string, Task<string>> _fetch;
    private readonly int _maxRetries;
    private readonly TimeSpan _baseDelay;

    public RetryingHttpClient(Func<string, Task<string>> fetch, int maxRetries = 3, TimeSpan? baseDelay = null)
    {
        _fetch = fetch;
        _maxRetries = maxRetries;
        _baseDelay = baseDelay ?? TimeSpan.FromMilliseconds(100);
    }

    public async Task<string> GetWithRetryAsync(string url)
    {
        var attempt = 0;
        while (true)
        {
            try
            {
                return await _fetch(url);
            }
            catch (Exception) when (attempt < _maxRetries)
            {
                attempt++;
                var delay = TimeSpan.FromMilliseconds(_baseDelay.TotalMilliseconds * Math.Pow(2, attempt - 1));
                await Task.Delay(delay);
            }
        }
    }
}

class Program
{
    static async Task Main()
    {
        var attempts = 0;
        var client = new RetryingHttpClient(async url =>
        {
            attempts++;
            if (attempts < 3) throw new InvalidOperationException("simulated failure");
            await Task.CompletedTask;
            return $"response from {url}";
        });

        var result = await client.GetWithRetryAsync("https://example.com");
        Console.WriteLine(result);
    }
}
