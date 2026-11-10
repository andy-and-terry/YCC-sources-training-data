public class DelannoyNumbers {
    public static Long centralDelannoy(Integer n) {
        List<List<Long>> g = new List<List<Long>>();
        for (Integer i = 0; i <= n; i++) {
            List<Long> row = new List<Long>();
            for (Integer j = 0; j <= n; j++) {
                row.add((i == 0 || j == 0) ? 1L : g[i - 1][j] + row[j - 1] + g[i - 1][j - 1]);
            }
            g.add(row);
        }
        return g[n][n];
    }

    public static void run() {
        List<Long> out = new List<Long>();
        for (Integer n = 0; n <= 5; n++) out.add(centralDelannoy(n));
        System.debug(out); // (1, 3, 13, 63, 321, 1683)
    }
}
