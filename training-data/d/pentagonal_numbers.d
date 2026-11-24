import std.stdio;

// Pentagonal numbers: n(3n-1)/2.
void main() {
    foreach (n; 1 .. 11)
        write(n * (3 * n - 1) / 2, " ");
    writeln();
}
