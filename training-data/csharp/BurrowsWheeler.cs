using System;
using System.Linq;

class BurrowsWheeler
{
    static void Main()
    {
        string s = "banana$";
        var rots = Enumerable.Range(0, s.Length)
            .Select(i => s.Substring(i) + s.Substring(0, i))
            .OrderBy(r => r, StringComparer.Ordinal);
        Console.WriteLine(new string(rots.Select(r => r[^1]).ToArray()));
    }
}
