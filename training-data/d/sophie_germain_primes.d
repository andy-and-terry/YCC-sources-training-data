import std.stdio;

bool isPrime(long n) {
    if (n < 2) return false;
    for (long i = 2; i * i <= n; i++) if (n % i == 0) return false;
    return true;
}

void main() {
    int count = 0;
    for (long p = 2; count < 10; p++) {
        if (isPrime(p) && isPrime(2 * p + 1)) { write(p, " "); count++; }
    }
    writeln(); // 2 3 5 11 23 29 41 53 83 89
}
