import std.stdio;

void main() {
    int[] a = [1, 2, 3, 4, 5, 6];

    auto mid = a[1 .. 4];
    writeln(mid);

    mid[0] = 99;
    writeln(a);

    auto copy = a[1 .. 4].dup;
    copy[0] = -1;
    writeln(a);
    writeln(copy);

    writeln(a[$ - 2 .. $]);
    writeln(a[0 .. 0].length);

    a ~= 7;
    a = a[0 .. 3] ~ a[5 .. $];
    writeln(a);

    int[3] fixed = [1, 2, 3];
    int[] view = fixed[];
    view[1] = 20;
    writeln(fixed);

    a[] = 0;
    writeln(a);
}
