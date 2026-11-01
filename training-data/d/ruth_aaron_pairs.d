import std.stdio;

// Sum of prime factors counted with multiplicity.
int sopfr(int n) {
    int total = 0;
    for (int p = 2; p * p <= n; p++)
        while (n % p == 0) { total += p; n /= p; }
    return total + (n > 1 ? n : 0);
}

void main() {
    foreach (n; 2 .. 110)
        if (sopfr(n) == sopfr(n + 1)) write(n, " ");
    writeln();
}
