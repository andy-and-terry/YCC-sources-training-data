import std.stdio;

void main() {
    int[] a = [1, 2, 3, 4, 5];
    a[1 .. 4] *= 2;
    writeln(a);
    writeln(a[$ - 2 .. $]);
}
