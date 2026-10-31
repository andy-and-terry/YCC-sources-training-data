import std.stdio;

int persistence(long n) {
    int steps = 0;
    while (n >= 10) {
        long product = 1;
        for (; n > 0; n /= 10) product *= n % 10;
        n = product;
        steps++;
    }
    return steps;
}

void main() {
    foreach (n; [39L, 77L, 999L, 10L])
        writeln(n, " ", persistence(n));
}
