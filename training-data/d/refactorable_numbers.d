import std.stdio, std.algorithm, std.range;

size_t tau(int n) { return iota(1, n + 1).count!(d => n % d == 0); }

void main() {
    foreach (n; iota(1, 60).filter!(n => n % tau(n) == 0)) write(n, " ");
    writeln(); // 1 2 8 9 12 18 24 36 40 56
}
