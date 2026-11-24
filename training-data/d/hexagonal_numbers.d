import std.stdio;

// Hexagonal numbers: n(2n-1).
void main() {
    foreach (n; 1 .. 11)
        write(n * (2 * n - 1), " ");
    writeln();
}
