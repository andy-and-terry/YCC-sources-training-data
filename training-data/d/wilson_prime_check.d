import std.stdio;
// Wilson's theorem primality test.
bool wilson(long n) {
    if (n < 2) return false;
    long f = 1;
    foreach (i; 2 .. n) f = f * i % n;
    return f == n - 1;
}
void main() { foreach (n; 2 .. 20) if (wilson(n)) write(n, " "); writeln(); }
