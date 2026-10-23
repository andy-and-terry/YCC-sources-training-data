import std.stdio;
import std.algorithm : map;
import std.array : array;
import std.conv : to;

enum rows = 6;
enum cols = 6;
alias Grid = bool[cols][rows];

int neighbors(const ref Grid g, int r, int c)
{
    int count = 0;
    foreach (dr; -1 .. 2)
        foreach (dc; -1 .. 2)
        {
            if (dr == 0 && dc == 0) continue;
            if (g[(r + dr + rows) % rows][(c + dc + cols) % cols]) count++;
        }
    return count;
}

Grid step(const ref Grid g)
{
    Grid next;
    foreach (r; 0 .. rows)
        foreach (c; 0 .. cols)
        {
            immutable n = neighbors(g, r, c);
            next[r][c] = g[r][c] ? (n == 2 || n == 3) : n == 3;
        }
    return next;
}

void show(const ref Grid g)
{
    foreach (row; g)
        writeln(row[].map!(x => x ? '#' : '.').array.to!string);
}

void main()
{
    Grid g;
    g[0][1] = g[1][2] = g[2][0] = g[2][1] = g[2][2] = true; // glider

    foreach (gen; 0 .. 3)
    {
        writeln("Generation ", gen, ":");
        show(g);
        g = step(g);
    }
}
