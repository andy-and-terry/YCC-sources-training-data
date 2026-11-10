import std.stdio, std.algorithm, std.range;

int sigma(int n) { return iota(1, n + 1).filter!(d => n % d == 0).sum; }

void main() {
    foreach (n; iota(1, 100).filter!(n => sigma(sigma(n)) == 2 * n)) write(n, " ");
    writeln(); // 2 4 16 64
}
