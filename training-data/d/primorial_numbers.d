// Primorials up to 1e6, including 1; expect 8.
import std.stdio;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

void main() {
    long[] values = [1];
    long acc = 1;
    for (int p = 2; ; p++) {
        if (!isPrime(p)) continue;
        acc *= p;
        if (acc > 1_000_000) break;
        values ~= acc;
    }
    writeln(values.length, " ", values);
}
