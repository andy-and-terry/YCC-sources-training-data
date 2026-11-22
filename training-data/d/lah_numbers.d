import std.stdio;

// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
long fact(int n) { return n <= 1 ? 1 : n * fact(n - 1); }
long comb(int n, int k) { return fact(n) / (fact(k) * fact(n - k)); }

void main() {
    enum n = 5;
    foreach (k; 1 .. n + 1) write(comb(n - 1, k - 1) * fact(n) / fact(k), " ");
    writeln();
}
