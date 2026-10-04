import std.stdio;
import std.range : zip, chain, only;
import std.algorithm : map;
import std.array : array;

int[][] pascal(int n)
{
    int[][] rows = [[1]];
    foreach (_; 1 .. n)
    {
        auto prev = rows[$ - 1];
        rows ~= zip(chain(only(0), prev), chain(prev, only(0)))
            .map!(t => t[0] + t[1]).array;
    }
    return rows;
}

void main()
{
    foreach (row; pascal(6))
        writeln(row);
}
