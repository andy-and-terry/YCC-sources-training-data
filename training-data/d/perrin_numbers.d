import std.stdio;

// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
void main() {
    long[] p = [3, 0, 2];
    foreach (n; 3 .. 15) p ~= p[n - 2] + p[n - 3];
    writeln(p);
}
