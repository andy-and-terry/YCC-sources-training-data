using System;
using System.Linq;

class PerfectNumber
{
    enum Kind { Deficient, Perfect, Abundant }

    static void Main()
    {
        const int Limit = 100_000;
        var sums = new int[Limit + 1];
        for (int d = 1; d <= Limit / 2; d++)
            for (int m = 2 * d; m <= Limit; m += d) sums[m] += d;

        Kind Classify(int n) => sums[n].CompareTo(n) switch { 0 => Kind.Perfect, > 0 => Kind.Abundant, _ => Kind.Deficient };

        var counts = Enumerable.Range(2, Limit - 1).GroupBy(Classify).OrderBy(g => g.Key);
        foreach (var g in counts) Console.WriteLine($"{g.Key}: {g.Count()}");
        Console.WriteLine("perfect: " + string.Join(", ", Enumerable.Range(2, Limit - 1).Where(n => Classify(n) == Kind.Perfect)));
        var amicable = Enumerable.Range(2, Limit - 1).Where(a => sums[a] > a && sums[a] <= Limit && sums[sums[a]] == a).Select(a => (a, sums[a]));
        Console.WriteLine("amicable: " + string.Join(" ", amicable.Take(5)));
    }
}
