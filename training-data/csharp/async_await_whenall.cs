using System;
using System.Linq;
using System.Threading.Tasks;

class AsyncAwaitWhenAll {
    static async Task<int> Work(int n) { await Task.Delay(10); return n * 2; }

    static async Task Main() {
        var rs = await Task.WhenAll(Enumerable.Range(1, 4).Select(Work));
        Console.WriteLine(rs.Sum());
    }
}
