using System;
using System.Linq;

class SuperperfectNumbers
{
    static int Sigma(int n) => Enumerable.Range(1, n).Where(d => n % d == 0).Sum();

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 99).Where(n => Sigma(Sigma(n)) == 2 * n))); // 2 4 16 64
}
