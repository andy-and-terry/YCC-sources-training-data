// Lattice paths with a DP row.
public class LatticePaths {
    public static Long count(Integer n) {
        List<Long> row = new List<Long>();
        for (Integer i = 0; i <= n; i++) { row.add(1L); }
        for (Integer k = 0; k < n; k++) {
            for (Integer j = 1; j <= n; j++) { row[j] = row[j] + row[j - 1]; }
        }
        return row[n];
    }
}
