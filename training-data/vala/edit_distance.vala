int edit_distance(string a, string b) {
    int m = a.length;
    int n = b.length;
    int[,] table = new int[m + 1, n + 1];
    for (int i = 0; i <= m; i++) table[i, 0] = i;
    for (int j = 0; j <= n; j++) table[0, j] = j;
    for (int i = 1; i <= m; i++) {
        for (int j = 1; j <= n; j++) {
            int cost = (a[i - 1] == b[j - 1]) ? 0 : 1;
            int del_cost = table[i - 1, j] + 1;
            int ins_cost = table[i, j - 1] + 1;
            int sub_cost = table[i - 1, j - 1] + cost;
            table[i, j] = int.min(del_cost, int.min(ins_cost, sub_cost));
        }
    }
    return table[m, n];
}

void main() {
    stdout.printf("%d\n", edit_distance("kitten", "sitting"));
}
