using System;
using System.Linq;

class DeficientNumbers
{
    static int Sigma(int n) => Enumerable.Range(1, n).Where(d => n % d == 0).Sum();

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 20).Where(n => Sigma(n) < 2 * n)));
}
