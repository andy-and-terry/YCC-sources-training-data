using System;
using System.Linq;
using System.Threading.Tasks;

class ParallelForDemo
{
    static void Main()
    {
        var squares = new int[10];
        Parallel.For(0, squares.Length, i => squares[i] = i * i);
        Console.WriteLine(string.Join(",", squares));

        long total = 0;
        object gate = new();
        Parallel.For(1, 101, () => 0L,
            (i, _, local) => local + i,
            local => { lock (gate) total += local; });
        Console.WriteLine(total);

        var evens = Enumerable.Range(1, 20).AsParallel().AsOrdered().Where(n => n % 2 == 0);
        Console.WriteLine(string.Join(" ", evens));
    }
}
