// Lattice paths with a rolling DP row.
public class LatticePaths {
    static long lattice(int n) {
        long[] row = new long[n + 1];
        java.util.Arrays.fill(row, 1);
        for (int k = 0; k < n; k++) for (int j = 1; j <= n; j++) row[j] += row[j - 1];
        return row[n];
    }

    public static void main(String[] args) {
        System.out.println(lattice(3));
    }
}
