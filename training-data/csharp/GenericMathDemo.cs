using System;
using System.Collections.Generic;
using System.Numerics;

class GenericMathDemo
{
    static T Sum<T>(IEnumerable<T> items) where T : INumber<T>
    {
        T total = T.Zero;
        foreach (var x in items) total += x;
        return total;
    }

    static T Average<T>(IReadOnlyCollection<T> items) where T : INumber<T>
        => Sum(items) / T.CreateChecked(items.Count);

    static T Clamp<T>(T value, T lo, T hi) where T : IComparisonOperators<T, T, bool>
        => value < lo ? lo : value > hi ? hi : value;

    static void Main()
    {
        Console.WriteLine(Sum(new[] { 1, 2, 3, 4 }));
        Console.WriteLine(Sum(new[] { 1.5, 2.5 }));
        Console.WriteLine(Average(new List<decimal> { 10m, 20m, 25m }));
        Console.WriteLine(Clamp(15, 0, 10));
        Console.WriteLine(Clamp(-0.5, 0.0, 1.0));
    }
}
