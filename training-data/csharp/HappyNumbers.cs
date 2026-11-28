using System;
using System.Collections.Generic;
using System.Linq;

static class HappyNumbers
{
    static bool IsHappy(int n)
    {
        var seen = new HashSet<int>();
        while (n != 1 && seen.Add(n))
            n = n.ToString().Sum(c => (c - '0') * (c - '0'));
        return n == 1;
    }

    static void Main()
    {
        var found = Enumerable.Range(1, 100).Where(IsHappy).Take(8);
        Console.WriteLine(string.Join(" ", found)); // 1 7 10 13 19 23 28 31
    }
}
