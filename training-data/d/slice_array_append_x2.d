import std.stdio;

void main() {
    int[] a = [1, 2, 3, 4, 5];
    auto mid = a[1 .. 4];
    mid[0] = 20;
    a ~= 6;
    writeln(a);
}
