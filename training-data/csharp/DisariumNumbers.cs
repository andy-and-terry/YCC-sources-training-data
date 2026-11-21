using System;
using System.Linq;

// Disarium numbers: digits raised to their 1-based positions sum to n.
class DisariumNumbers
{
    static bool IsDisarium(int n) =>
        n.ToString().Select((c, i) => (int)Math.Round(Math.Pow(c - '0', i + 1))).Sum() == n;

    static void Main()
    {
        Console.WriteLine(string.Join(" ", Enumerable.Range(1, 999).Where(IsDisarium)));
    }
}
