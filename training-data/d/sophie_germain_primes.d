import std.stdio;

// Sophie Germain primes: p prime and 2p + 1 prime.
bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

void main() {
    foreach (p; 2 .. 100)
        if (isPrime(p) && isPrime(2 * p + 1)) write(p, " ");
    writeln();
}
