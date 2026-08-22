using System;
using System.Threading.Tasks;

class AsyncAwaitDemo
{
    static async Task<string> FetchWithRetryAsync(Func<string, Task<string>> fetch, string url, int maxRetries = 3)
    {
        int attempt = 0;
        while (true)
        {
            try
            {
                return await fetch(url);
            }
            catch (Exception) when (attempt < maxRetries)
            {
                attempt++;
                await Task.Delay(TimeSpan.FromMilliseconds(10 * Math.Pow(2, attempt - 1)));
            }
        }
    }

    static async Task Main()
    {
        int attempts = 0;
        Func<string, Task<string>> flakyFetch = async url =>
        {
            attempts++;
            if (attempts < 3) throw new InvalidOperationException("simulated failure");
            await Task.CompletedTask;
            return $"response from {url}";
        };

        var result = await FetchWithRetryAsync(flakyFetch, "https://example.com");
        Console.WriteLine(result);
    }
}
