import std.stdio;
import std.algorithm : sort, sum, reverse;

void main() {
    int[5] a = [5, 3, 1, 4, 2];
    int[5] b = a;
    b[0] = 100;
    writeln(a);
    writeln(b);

    int[3][2] grid;
    foreach (r; 0 .. 2)
        foreach (c; 0 .. 3)
            grid[r][c] = r * 3 + c;
    writeln(grid);

    a[].sort();
    writeln(a);
    writeln(a[].sum);

    int[4] zeros;
    writeln(zeros);
    int[4] sevens = 7;
    writeln(sevens);
    writeln(a.length, " ", a.sizeof);

    auto dyn = a[].dup;
    dyn ~= 6;
    writeln(dyn);
}
