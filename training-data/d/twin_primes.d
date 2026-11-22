import std.stdio;

// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

void main() {
    foreach (p; 2 .. 100)
        if (isPrime(p) && isPrime(p + 2)) write(p, " ");
    writeln();
}
