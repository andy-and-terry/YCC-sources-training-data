import std.stdio;

bool isSphenic(int n) {
    int distinct = 0;
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            n /= p;
            if (n % p == 0) return false;
            distinct++;
        }
    }
    return distinct + (n > 1 ? 1 : 0) == 3;
}

void main() {
    foreach (n; 2 .. 80)
        if (isSphenic(n)) write(n, " ");
    writeln();
}
