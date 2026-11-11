// Square of the sum minus sum of squares for 1..10 (expect 2640)
using System;
using System.Linq;

class SumSquareDifference
{
    static void Main()
    {
        var xs = Enumerable.Range(1, 10).ToArray();
        int sum = xs.Sum();
        int squares = xs.Sum(x => x * x);
        Console.WriteLine(sum * sum - squares);
    }
}
