import std.stdio;

// Ways to write n as a sum of two or more consecutive positive integers.
int politeWays(int n) {
    int ways = 0;
    for (int k = 2; k * (k + 1) / 2 <= n; k++)
        if ((n - k * (k - 1) / 2) % k == 0) ways++;
    return ways;
}

void main() {
    foreach (n; 1 .. 17)
        write(politeWays(n), " ");
    writeln();
}
