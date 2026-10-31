import std.stdio;

bool isPowerful(int n) {
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            if (n % (p * p) != 0) return false;
            while (n % p == 0) n /= p;
        }
    }
    return n == 1;
}

void main() {
    foreach (n; 1 .. 101)
        if (isPowerful(n)) write(n, " ");
    writeln();
}
