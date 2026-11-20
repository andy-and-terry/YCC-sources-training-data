// Lattice paths with a DP row.
int64 lattice (int n) {
    var row = new int64[n + 1];
    for (int i = 0; i <= n; i++) row[i] = 1;
    for (int k = 0; k < n; k++)
        for (int j = 1; j <= n; j++) row[j] += row[j - 1];
    return row[n];
}

void main () {
    print ("%lld\n", lattice (3));
}
