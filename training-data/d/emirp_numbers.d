// Emirps: primes whose digit reversal is a different prime.
import std.algorithm : reverse;
import std.conv : to;
import std.stdio;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++)
        if (n % i == 0) return false;
    return true;
}

int rev(int n) {
    int r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

void main() {
    foreach (n; 2 .. 100) {
        int r = rev(n);
        if (r != n && isPrime(n) && isPrime(r)) write(n, " ");
    }
    writeln();
}
