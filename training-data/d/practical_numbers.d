import std.stdio;

// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
bool isPractical(int n) {
    ulong reach = 1; // bit i set <=> i is a subset sum
    foreach (d; 1 .. n + 1)
        if (n % d == 0) reach |= reach << d;
    ulong mask = (1UL << (n + 1)) - 1;
    return (reach & mask) == mask;
}

void main() {
    foreach (n; 1 .. 41)
        if (isPractical(n)) write(n, " ");
    writeln();
}
