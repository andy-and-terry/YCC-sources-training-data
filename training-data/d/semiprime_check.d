import std.stdio;

int primeFactorCount(int n) {
    int count = 0;
    for (int p = 2; p * p <= n; p++)
        while (n % p == 0) { n /= p; count++; }
    return n > 1 ? count + 1 : count;
}

void main() {
    foreach (n; 2 .. 30)
        if (primeFactorCount(n) == 2) write(n, " ");
    writeln();
}
