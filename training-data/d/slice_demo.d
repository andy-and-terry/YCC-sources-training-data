import std.stdio;

void main() {
    int[] a = [1, 2, 3, 4, 5, 6, 7, 8];

    int[] mid = a[2 .. 5];
    writeln(mid);

    mid[0] = 99;
    writeln("original sees write: ", a);

    int[] copy = a.dup;
    copy[0] = -1;
    writeln(a[0], " vs ", copy[0]);

    writeln(a[$ - 3 .. $]);
    writeln(a[0 .. $ / 2]);

    a ~= 9;
    a[1 .. 3] = 0;
    writeln(a);

    int[] fill = new int[](4);
    fill[] = 7;
    writeln(fill);
    writeln(a.length, " ", mid.length);
}
