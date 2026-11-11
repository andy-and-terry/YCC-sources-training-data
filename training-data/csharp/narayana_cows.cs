// Narayana's cows N(n)=N(n-1)+N(n-3)
using System;

class NarayanaCows
{
    static void Main()
    {
        var v = new long[10] { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0 };
        for (int i = 3; i < 10; i++) v[i] = v[i - 1] + v[i - 3];
        Console.WriteLine(string.Join(" ", v));
    }
}
