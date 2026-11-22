using System;
using System.Linq;

// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
class LazyCatererNumbers
{
    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(n => n * (n + 1) / 2 + 1)));
    }
}
