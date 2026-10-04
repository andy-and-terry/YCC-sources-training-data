import std.stdio;

void main()
{
    int[] a = [1, 2, 3, 4, 5, 6];
    auto mid = a[2 .. 4];
    mid[0] = 99;              // slices share memory
    writeln(a);

    auto b = a.dup;           // independent copy
    b[0] = -1;
    writeln(a[0], " ", b[0]);

    a ~= 7;                   // append may reallocate
    writeln(a.length, " ", a[$ - 1]);
    writeln(a[$ / 2 .. $]);

    int[3] fixed = [1, 2, 3];
    int[] view = fixed[];
    view[1] = 20;
    writeln(fixed);
}
