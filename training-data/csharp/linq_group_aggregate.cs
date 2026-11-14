using System;
using System.Linq;

var words = new[] { "apple", "avocado", "banana", "blueberry", "cherry" };
foreach (var g in words.GroupBy(w => w[0]).Select(g => new { g.Key, Count = g.Count(), Longest = g.Max(w => w.Length) }))
    Console.WriteLine($"{g.Key}: {g.Count} (longest {g.Longest})");
