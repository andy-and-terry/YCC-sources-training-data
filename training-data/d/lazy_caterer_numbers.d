import std.stdio;

// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
void main() {
    foreach (n; 0 .. 10) write(n * (n + 1) / 2 + 1, " ");
    writeln();
}
