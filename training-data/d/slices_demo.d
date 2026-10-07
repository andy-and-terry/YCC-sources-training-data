import std.stdio;

void main() {
    int[] a = [1, 2, 3, 4, 5, 6];
    int[] mid = a[1 .. 4];
    writeln(mid);

    mid[0] = 99;          // slices share memory
    writeln(a);

    a ~= 7;               // append
    writeln(a.length);
    a = a[0 .. $ - 2];    // drop last two
    writeln(a);

    int[] copy = a.dup;
    copy[0] = -1;
    writeln(a[0], " ", copy[0]);

    int[3] fixed = [1, 2, 3];
    int[] view = fixed[];
    view[1] = 20;
    writeln(fixed);
    writeln(a[$ - 1]);
    a[] = 0;
    writeln(a);
}
