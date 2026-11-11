// Pronic numbers n(n+1)
using System;
using System.Linq;

class PronicNumbers
{
    static long Term(long n) => n * (n + 1);

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(0, 10).Select(n => Term(n))));
    }
}
