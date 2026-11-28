using System;

class TwinPrimes
{
    static void Main()
    {
        const int n = 50;
        var composite = new bool[n + 1];
        for (int i = 2; i * i <= n; i++)
            if (!composite[i])
                for (int j = i * i; j <= n; j += i) composite[j] = true;
        for (int p = 3; p + 2 <= n; p++)
            if (!composite[p] && !composite[p + 2]) Console.Write($"({p}, {p + 2}) ");
        Console.WriteLine();
    }
}
