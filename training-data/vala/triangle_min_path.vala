int minimum_total (int[,] t, int rows) {
    var dp = new int[rows];
    for (int i = 0; i < rows; i++) dp[i] = t[rows - 1, i];
    for (int r = rows - 2; r >= 0; r--)
        for (int i = 0; i <= r; i++)
            dp[i] = t[r, i] + int.min (dp[i], dp[i + 1]);
    return dp[0];
}

void main () {
    int[,] t = { { 2, 0, 0, 0 }, { 3, 4, 0, 0 }, { 6, 5, 7, 0 }, { 4, 1, 8, 3 } };
    print ("%d\n", minimum_total (t, 4)); // 11
}
