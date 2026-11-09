import std.stdio;

void main() {
    int[] a = [1, 2, 3, 4, 5];
    auto s = a[1 .. 4];
    s[0] = 20;
    writeln(a);
    writeln(a[$ - 2 .. $]);
}
