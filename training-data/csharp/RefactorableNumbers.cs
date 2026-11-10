using System;
using System.Linq;

class RefactorableNumbers
{
    static int Tau(int n) => Enumerable.Range(1, n).Count(d => n % d == 0);

    static void Main() =>
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 59).Where(n => n % Tau(n) == 0))); // 1 2 8 9 12 18 24 36 40 56
}
