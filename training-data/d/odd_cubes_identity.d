import std.stdio;

long cubeFromOdds(long n) {
    long start = n * n - n + 1, sum = 0;
    foreach (i; 0 .. n) sum += start + 2 * i;
    return sum;
}

void main() {
    foreach (n; 1 .. 6)
        writeln(n, " ", cubeFromOdds(n), " ", cubeFromOdds(n) == n * n * n);
}
