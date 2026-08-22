import std.stdio;
import std.math : sqrt;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}

void main() {
    for (int n = 2; n <= 20; n++) {
        if (isPrime(n)) write(n, " ");
    }
    writeln();
}
