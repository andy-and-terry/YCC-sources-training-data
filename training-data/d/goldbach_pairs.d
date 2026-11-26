// Goldbach partitions of 100; expect 6.
import std.stdio;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

void main() {
    int c = 0;
    foreach (p; 2 .. 51) {
        if (isPrime(p) && isPrime(100 - p)) { writeln(p, "+", 100 - p); c++; }
    }
    writeln(c);
}
