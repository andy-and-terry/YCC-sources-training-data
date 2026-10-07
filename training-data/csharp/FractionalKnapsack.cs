using System;
using System.Collections.Generic;
using System.Linq;

record Item(string Name, double Value, double Weight)
{
    public double Ratio => Value / Weight;
}

class FractionalKnapsack
{
    static (double Total, List<(string Name, double Fraction)> Taken) Solve(IEnumerable<Item> items, double capacity)
    {
        double total = 0;
        var taken = new List<(string, double)>();
        foreach (var it in items.OrderByDescending(i => i.Ratio))
        {
            if (capacity <= 0) break;
            double take = Math.Min(it.Weight, capacity);
            total += it.Value * take / it.Weight;
            taken.Add((it.Name, take / it.Weight));
            capacity -= take;
        }
        return (total, taken);
    }

    static void Main()
    {
        var (total, taken) = Solve(new[] { new Item("gold", 60, 10), new Item("silver", 100, 20), new Item("bronze", 120, 30) }, 50);
        Console.WriteLine($"total {total}");
        foreach (var (name, frac) in taken) Console.WriteLine($"{name}: {frac:P0}");
    }
}
