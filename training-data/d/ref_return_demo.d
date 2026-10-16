import std.stdio;

ref int largest(ref int a, ref int b) {
    return a > b ? a : b;
}

void main() {
    int x = 3, y = 9;
    largest(x, y) = 0;
    writeln(x, " ", y);
}
