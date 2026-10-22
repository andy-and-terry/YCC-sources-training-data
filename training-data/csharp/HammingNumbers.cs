using System;
using System.Collections.Generic;

// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
class HammingNumbers
{
    static bool IsHamming(int n)
    {
        foreach (int p in new[] { 2, 3, 5 })
            while (n % p == 0) n /= p;
        return n == 1;
    }

    static void Main()
    {
        var found = new List<int>();
        for (int n = 1; found.Count < 20; n++)
            if (IsHamming(n)) found.Add(n);
        Console.WriteLine(string.Join(" ", found));
    }
}
