import std.stdio;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

void main() {
    foreach (n; 2 .. 31) {
        if (isPrime(n)) write(n, " ");
    }
    writeln();
}
