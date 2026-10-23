import std.stdio;

struct Move
{
    char from;
    char to;
}

void hanoi(int n, char from, char to, char via, ref Move[] moves)
{
    if (n == 0) return;
    hanoi(n - 1, from, via, to, moves);
    moves ~= Move(from, to);
    hanoi(n - 1, via, to, from, moves);
}

void main()
{
    Move[] moves;
    hanoi(4, 'A', 'C', 'B', moves);

    foreach (i, m; moves)
        writefln("%2d: %s -> %s", i + 1, m.from, m.to);

    writefln("Total moves: %d (2^4 - 1 = %d)", moves.length, (1 << 4) - 1);
}
