int matrix_chain_order(int[] dims) {
    int n = dims.length - 1;
    int[,] dp = new int[n, n];

    for (int len = 2; len <= n; len++) {
        for (int i = 0; i <= n - len; i++) {
            int j = i + len - 1;
            dp[i, j] = int.MAX;
            for (int k = i; k < j; k++) {
                int cost = dp[i, k] + dp[k + 1, j] + dims[i] * dims[k + 1] * dims[j + 1];
                if (cost < dp[i, j]) {
                    dp[i, j] = cost;
                }
            }
        }
    }
    return dp[0, n - 1];
}

void main() {
    int[] dims = { 10, 20, 30, 40, 30 };
    stdout.printf("%d\n", matrix_chain_order(dims));
}
