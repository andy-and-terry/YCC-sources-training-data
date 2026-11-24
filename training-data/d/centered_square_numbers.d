import std.stdio;

// Centered square numbers: n^2 + (n+1)^2.
void main() {
    foreach (n; 0 .. 10)
        write(n * n + (n + 1) * (n + 1), " ");
    writeln();
}
