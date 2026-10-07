using System;
using System.Collections.Generic;
using System.Linq;

class KnightMinMoves
{
    static readonly (int, int)[] Moves = { (1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1), (-2, 1), (-1, 2) };

    static (int X, int Y) Parse(string sq) => (sq[0] - 'a', sq[1] - '1');
    static string Name((int X, int Y) p) => $"{(char)('a' + p.X)}{p.Y + 1}";

    static List<string> Path(string from, string to)
    {
        var start = Parse(from);
        var goal = Parse(to);
        var prev = new Dictionary<(int, int), (int, int)> { [start] = start };
        var q = new Queue<(int X, int Y)>();
        q.Enqueue(start);
        while (q.Count > 0 && !prev.ContainsKey(goal))
        {
            var cur = q.Dequeue();
            foreach (var (dx, dy) in Moves)
            {
                var next = (cur.X + dx, cur.Y + dy);
                if (next.Item1 is < 0 or > 7 || next.Item2 is < 0 or > 7 || prev.ContainsKey(next)) continue;
                prev[next] = cur;
                q.Enqueue(next);
            }
        }
        var path = new List<string> { Name(goal) };
        for (var node = goal; node != start; node = prev[node]) path.Add(Name(prev[node]));
        path.Reverse();
        return path;
    }

    static void Main()
    {
        foreach (var (a, b) in new[] { ("a1", "h8"), ("a1", "b2"), ("d4", "d5") })
        {
            var p = Path(a, b);
            Console.WriteLine($"{a}->{b} ({p.Count - 1} moves): {string.Join(" ", p)}");
        }
    }
}
