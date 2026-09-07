string longest_common_subsequence(string a, string b) {
    int m = a.length;
    int n = b.length;
    int[,] table = new int[m + 1, n + 1];

    for (int i = 1; i <= m; i++) {
        for (int j = 1; j <= n; j++) {
            if (a[i - 1] == b[j - 1]) {
                table[i, j] = table[i - 1, j - 1] + 1;
            } else if (table[i - 1, j] >= table[i, j - 1]) {
                table[i, j] = table[i - 1, j];
            } else {
                table[i, j] = table[i, j - 1];
            }
        }
    }

    var result = new StringBuilder();
    int x = m, y = n;
    while (x > 0 && y > 0) {
        if (a[x - 1] == b[y - 1]) {
            result.prepend_c(a[x - 1]);
            x--;
            y--;
        } else if (table[x - 1, y] >= table[x, y - 1]) {
            x--;
        } else {
            y--;
        }
    }
    return result.str;
}

void main() {
    string result = longest_common_subsequence("ABCBDAB", "BDCABA");
    stdout.printf("%s\n", result);
    stdout.printf("%d\n", result.length);
}
