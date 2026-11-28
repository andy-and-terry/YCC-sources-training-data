using System;
using System.Linq;

class ManhattanDistance
{
    static int Manhattan(int[] a, int[] b) => a.Zip(b, (x, y) => Math.Abs(x - y)).Sum();

    static void Main() => Console.WriteLine(Manhattan(new[] { 1, 2 }, new[] { 4, 6 }));
}
