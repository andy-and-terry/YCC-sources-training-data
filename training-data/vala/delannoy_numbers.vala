int64 central_delannoy (int n) {
    var g = new int64[(n + 1) * (n + 1)];
    for (int i = 0; i <= n; i++)
        for (int j = 0; j <= n; j++)
            g[i * (n + 1) + j] = (i == 0 || j == 0) ? 1 :
                g[(i - 1) * (n + 1) + j] + g[i * (n + 1) + j - 1] + g[(i - 1) * (n + 1) + j - 1];
    return g[n * (n + 1) + n];
}

void main () {
    for (int n = 0; n <= 5; n++) print ("%lld ", central_delannoy (n));
    print ("\n"); // 1 3 13 63 321 1683
}
