using System;
using System.Linq;

// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
class CyclopsNumbers
{
    static bool IsCyclops(int n)
    {
        string s = n.ToString();
        return s.Length % 2 == 1 && s[s.Length / 2] == '0' && s.Count(c => c == '0') == 1;
    }

    static void Main()
    {
        Console.WriteLine(Enumerable.Range(1, 99999).Count(IsCyclops));
    }
}
