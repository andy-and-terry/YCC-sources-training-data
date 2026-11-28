using System;
using System.Linq;

class SingleNumberXor
{
    static void Main() =>
        Console.WriteLine(new[] { 4, 1, 2, 1, 2 }.Aggregate(0, (acc, n) => acc ^ n)); // 4
}
