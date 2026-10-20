using System;
using System.Linq;
using System.Threading.Tasks;

class Program
{
    static async Task<int> Square(int n)
    {
        await Task.Delay(10);
        return n * n;
    }

    static async Task Main()
    {
        int[] results = await Task.WhenAll(Enumerable.Range(1, 4).Select(Square));
        Console.WriteLine(string.Join(",", results));
    }
}
