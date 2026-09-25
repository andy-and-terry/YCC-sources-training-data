using System;
using System.Collections.Generic;
using System.Linq;

class GameOfLife
{
    static HashSet<(int X, int Y)> Step(HashSet<(int X, int Y)> live)
    {
        var counts = live
            .SelectMany(c => from dx in new[] { -1, 0, 1 } from dy in new[] { -1, 0, 1 } where dx != 0 || dy != 0 select (c.X + dx, c.Y + dy))
            .GroupBy(c => c)
            .Select(g => (Cell: g.Key, N: g.Count()));
        return counts.Where(x => x.N == 3 || (x.N == 2 && live.Contains(x.Cell))).Select(x => x.Cell).ToHashSet();
    }

    static void Main()
    {
        var world = new HashSet<(int, int)> { (1, 0), (2, 1), (0, 2), (1, 2), (2, 2) };
        for (int gen = 0; gen < 4; gen++)
        {
            Console.WriteLine($"gen {gen}");
            for (int y = 0; y < 6; y++)
                Console.WriteLine(string.Concat(Enumerable.Range(0, 6).Select(x => world.Contains((x, y)) ? '#' : '.')));
            world = Step(world);
        }
    }
}
