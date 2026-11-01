import std.stdio;
import core.bitop : popcnt;

bool isPrime(uint n) {
    if (n < 2) return false;
    for (uint d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

// Pernicious numbers: the popcount is prime.
void main() {
    foreach (n; 1 .. 21)
        if (isPrime(popcnt(cast(uint) n))) write(n, " ");
    writeln();
}
