using System;
using System.Linq;
using System.Threading.Tasks;
class Program {
    static async Task<int> Sq(int n) { await Task.Delay(1); return n * n; }
    static async Task Main() {
        var rs = await Task.WhenAll(Enumerable.Range(1, 4).Select(Sq));
        Console.WriteLine(string.Join(",", rs));
    }
}
