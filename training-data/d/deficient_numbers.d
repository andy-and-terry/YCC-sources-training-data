import std.stdio;
import std.algorithm : filter, sum;
import std.range : iota;

int sigma(int n) {
    return iota(1, n + 1).filter!(d => n % d == 0).sum;
}

void main() {
    foreach (n; iota(1, 21)) if (sigma(n) < 2 * n) write(n, " ");
    writeln();
}
