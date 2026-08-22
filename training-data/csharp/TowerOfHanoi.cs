using System;
using System.Collections.Generic;

class TowerOfHanoi
{
    static void Hanoi(int n, char source, char target, char auxiliary, List<(char, char)> moves)
    {
        if (n == 1)
        {
            moves.Add((source, target));
            return;
        }
        Hanoi(n - 1, source, auxiliary, target, moves);
        moves.Add((source, target));
        Hanoi(n - 1, auxiliary, target, source, moves);
    }

    static void Main()
    {
        var moves = new List<(char, char)>();
        Hanoi(3, 'A', 'C', 'B', moves);
        foreach (var (s, t) in moves) Console.WriteLine($"{s} -> {t}");
    }
}
