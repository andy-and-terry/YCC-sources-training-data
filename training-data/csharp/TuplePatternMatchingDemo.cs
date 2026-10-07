using System;

enum Move { Rock, Paper, Scissors }

class TuplePatternMatchingDemo
{
    static string Play(Move a, Move b) => (a, b) switch
    {
        (Move.Rock, Move.Scissors) => "A wins",
        (Move.Paper, Move.Rock) => "A wins",
        (Move.Scissors, Move.Paper) => "A wins",
        var (x, y) when x == y => "draw",
        _ => "B wins",
    };

    static string Quadrant(int x, int y) => (x, y) switch
    {
        (0, 0) => "origin",
        (> 0, > 0) => "first quadrant",
        (< 0, > 0) => "second quadrant",
        (< 0, < 0) => "third quadrant",
        (> 0, < 0) => "fourth quadrant",
        _ => "on an axis",
    };

    static void Main()
    {
        Console.WriteLine(Play(Move.Rock, Move.Scissors));
        Console.WriteLine(Play(Move.Paper, Move.Paper));
        Console.WriteLine(Play(Move.Scissors, Move.Rock));

        Console.WriteLine(Quadrant(0, 0));
        Console.WriteLine(Quadrant(3, 4));
        Console.WriteLine(Quadrant(-3, -4));
    }
}
