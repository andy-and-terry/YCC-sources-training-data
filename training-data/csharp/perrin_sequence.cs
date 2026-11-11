// Perrin sequence P(n)=P(n-2)+P(n-3)
using System;

class PerrinSequence
{
    static void Main()
    {
        var v = new long[10] { 3, 0, 2, 0, 0, 0, 0, 0, 0, 0 };
        for (int i = 3; i < 10; i++) v[i] = v[i - 2] + v[i - 3];
        Console.WriteLine(string.Join(" ", v));
    }
}
