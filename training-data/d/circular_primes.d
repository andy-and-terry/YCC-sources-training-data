// Circular primes below 100; expect 13.
import std.stdio;
import std.conv : to;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

bool circular(int n) {
    string s = n.to!string;
    foreach (i; 0 .. s.length)
        if (!isPrime((s[i .. $] ~ s[0 .. i]).to!int)) return false;
    return true;
}

void main() {
    int c = 0;
    foreach (n; 2 .. 100) if (circular(n)) c++;
    writeln(c);
}
