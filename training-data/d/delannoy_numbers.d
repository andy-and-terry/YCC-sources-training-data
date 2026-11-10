import std.stdio;

long centralDelannoy(size_t n) {
    auto g = new long[][](n + 1, n + 1);
    foreach (i; 0 .. n + 1)
        foreach (j; 0 .. n + 1)
            g[i][j] = (i == 0 || j == 0) ? 1 : g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1];
    return g[n][n];
}

void main() {
    foreach (n; 0 .. 6) write(centralDelannoy(n), " ");
    writeln(); // 1 3 13 63 321 1683
}
