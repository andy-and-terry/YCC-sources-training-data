import std.stdio;
import std.conv : to;
import std.algorithm : reverse;

// Emirps: primes whose digit reversal is a different prime.
bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

int reverseNum(int n) {
    char[] s = n.to!string.dup;
    reverse(s);
    return s.to!int;
}

void main() {
    foreach (n; 2 .. 200) {
        int r = reverseNum(n);
        if (r != n && isPrime(n) && isPrime(r)) write(n, " ");
    }
    writeln();
}
