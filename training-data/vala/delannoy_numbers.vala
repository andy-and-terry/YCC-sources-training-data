void main () {
    const int N = 7;
    int64[,] d = new int64[N + 1, N + 1];
    for (int i = 0; i <= N; i++) {
        for (int j = 0; j <= N; j++) {
            d[i, j] = (i == 0 || j == 0) ? 1 : d[i - 1, j] + d[i, j - 1] + d[i - 1, j - 1];
        }
        print ("%lld ", d[i, i]);
    }
    print ("\n");
}
