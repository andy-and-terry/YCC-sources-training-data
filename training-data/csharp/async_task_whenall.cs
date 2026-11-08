using System;
using System.Linq;
using System.Threading.Tasks;

class AsyncTaskWhenAll
{
    static async Task<int> Square(int n)
    {
        await Task.Delay(10);
        return n * n;
    }

    static async Task Main()
    {
        var results = await Task.WhenAll(Enumerable.Range(1, 5).Select(Square));
        Console.WriteLine(string.Join(" ", results));
    }
}
