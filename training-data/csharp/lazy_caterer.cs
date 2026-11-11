// Lazy caterer sequence: max pieces from n cuts
using System;
using System.Linq;

class LazyCaterer
{
    static long Term(long n) => ((n * (n + 1))/2) + 1;

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(n => Term(n))));
    }
}
