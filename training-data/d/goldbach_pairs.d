import std.stdio;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
    return true;
}

void main() {
    enum n = 28;
    foreach (p; 2 .. n / 2 + 1)
        if (isPrime(p) && isPrime(n - p)) writefln("%d + %d", p, n - p);
}
