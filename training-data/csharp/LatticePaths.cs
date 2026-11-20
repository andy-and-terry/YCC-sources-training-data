using System;

// Lattice paths with a rolling DP row.
class LatticePaths {
    static long Lattice(int n) {
        var row = new long[n + 1];
        Array.Fill(row, 1L);
        for (int k = 0; k < n; k++) for (int j = 1; j <= n; j++) row[j] += row[j - 1];
        return row[n];
    }
    static void Main() => Console.WriteLine(Lattice(3));
}
