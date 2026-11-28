import std.stdio;
import std.bigint;

BigInt fact(int n) {
    BigInt r = 1;
    foreach (i; 2 .. n + 1) r *= i;
    return r;
}

BigInt lah(int n, int k) {
    return fact(n - 1) / (fact(k - 1) * fact(n - k)) * fact(n) / fact(k);
}

void main() {
    foreach (n; 1 .. 6) {
        foreach (k; 1 .. n + 1) write(lah(n, k), " ");
        writeln();
    }
}
