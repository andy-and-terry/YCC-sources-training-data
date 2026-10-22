public class DelannoyNumbers {
    // Central Delannoy numbers: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
    public static List<Long> central(Integer last) {
        List<List<Long>> d = new List<List<Long>>();
        List<Long> diagonal = new List<Long>();
        for (Integer m = 0; m <= last; m++) {
            List<Long> row = new List<Long>();
            for (Integer n = 0; n <= last; n++) {
                if (m == 0 || n == 0) {
                    row.add(1L);
                } else {
                    row.add(d[m - 1][n] + row[n - 1] + d[m - 1][n - 1]);
                }
            }
            d.add(row);
            diagonal.add(row[m]);
        }
        return diagonal;
    }

    public static void main() {
        System.debug(String.join(central(9), ' '));
    }
}
