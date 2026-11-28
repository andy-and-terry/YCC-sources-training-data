import std.stdio;
import std.conv : to;
import std.algorithm : filter, reverse;
import std.range : iota;
import std.array : array;

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
    writeln(iota(2, 100).filter!(p => isPrime(p) && rev(p) != p && isPrime(rev(p))).array);
}
