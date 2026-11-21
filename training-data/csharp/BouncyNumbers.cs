using System;
using System.Linq;

// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
class BouncyNumbers
{
    static bool IsBouncy(int n)
    {
        var d = n.ToString().ToCharArray();
        var up = d.OrderBy(c => c).ToArray();
        var down = d.OrderByDescending(c => c).ToArray();
        return !d.SequenceEqual(up) && !d.SequenceEqual(down);
    }

    static void Main()
    {
        Console.WriteLine(Enumerable.Range(1, 999).Count(IsBouncy));
    }
}
