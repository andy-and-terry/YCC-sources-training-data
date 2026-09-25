using System;
using System.Collections.Generic;
using System.Linq;

class HappyNumber
{
    static int Next(int n)
    {
        int s = 0;
        for (; n > 0; n /= 10) s += (n % 10) * (n % 10);
        return s;
    }

    static bool IsHappy(int n)
    {
        var seen = new HashSet<int>();
        while (n != 1 && seen.Add(n)) n = Next(n);
        return n == 1;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 50).Where(IsHappy)));
        Console.WriteLine($"count up to 10000: {Enumerable.Range(1, 10000).Count(IsHappy)}");
    }
}
