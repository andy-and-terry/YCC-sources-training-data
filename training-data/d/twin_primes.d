// Twin primes below 100; expect 8.
import std.stdio;
import std.range : iota;
import std.algorithm : count, filter;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

void main() {
    writeln(iota(2, 100).count!(p => isPrime(p) && isPrime(p + 2)));
}
