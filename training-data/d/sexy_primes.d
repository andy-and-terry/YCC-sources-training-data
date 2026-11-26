// Sexy primes below 100; expect 16 pairs.
import std.stdio;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

void main() {
    int c = 0;
    foreach (p; 2 .. 100) if (isPrime(p) && isPrime(p + 6)) c++;
    writeln(c);
}
